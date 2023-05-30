#include "kernel.h"
#include "debug.h"
#include "common.h"

/// the address of virtio mmio register r.
#define VIRTIO0_MMIO_REG(r) ((volatile uint32_t *)(VIRTIO0 + (r)))

static struct disk {
  // a set (not a ring) of DMA descriptors, with which the
  // driver tells the device where to read and write individual
  // disk operations. there are NUM descriptors.
  // most commands consist of a "chain" (a linked list) of a couple of
  // these descriptors.
  struct virtq_desc *desc;

  // a ring in which the driver writes descriptor numbers
  // that the driver would like the device to process.  it only
  // includes the head descriptor of each chain. the ring has
  // NUM elements.
  struct virtq_avail *avail;

  // a ring in which the device writes descriptor numbers that
  // the device has finished processing (just the head of each chain).
  // there are NUM used ring entries.
  struct virtq_used *used;

  // our own book-keeping.
  char free[NUM];  // is a descriptor free?
  uint16_t used_idx; // we've looked this far in used[2..NUM].

  // track info about in-flight operations,
  // for use when completion interrupt arrives.
  // indexed by first descriptor index of chain.
  struct {
    struct buf *b;
    char status;
  } info[NUM];

  // disk command headers.
  // one-for-one with descriptors, for convenience.
  struct virtio_blk_req ops[NUM];
  
  struct spinlock vdisk_lock;
  
} disk;

void fat32_disk_init() {
  Log("initializing fat32 disk...");
  
  uint32_t status = 0;

  if(*VIRTIO0_MMIO_REG(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
     *VIRTIO0_MMIO_REG(VIRTIO_MMIO_VERSION) != 2 ||
     *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DEVICE_ID) != 2 ||
     *VIRTIO0_MMIO_REG(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    Log("%lx", *VIRTIO0_MMIO_REG(VIRTIO_MMIO_MAGIC_VALUE));
    Log("%lx", *VIRTIO0_MMIO_REG(VIRTIO_MMIO_VERSION));
    Log("%lx", *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DEVICE_ID));
    Log("%lx", *VIRTIO0_MMIO_REG(VIRTIO_MMIO_VENDOR_ID));
    Assert(0, "could not find virtio disk");
  }
  
  // reset device
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_STATUS) = status;

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_STATUS) = status;

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_STATUS) = status;

  // negotiate features
  uint64_t features = *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DEVICE_FEATURES);
  features &= ~(1 << VIRTIO_BLK_F_RO);
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
  features &= ~(1 << VIRTIO_BLK_F_MQ);
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DRIVER_FEATURES) = features;

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_STATUS) = status;

  // re-read status to ensure FEATURES_OK is set.
  status = *VIRTIO0_MMIO_REG(VIRTIO_MMIO_STATUS);
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    Assert(0, "virtio disk FEATURES_OK unset");

  // initialize queue 0.
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_QUEUE_SEL) = 0;

  // ensure queue 0 is not in use.
  if(*VIRTIO0_MMIO_REG(VIRTIO_MMIO_QUEUE_READY))
    Assert(0, "virtio disk should not be ready");

  // check maximum queue size.
  uint32_t max = *VIRTIO0_MMIO_REG(VIRTIO_MMIO_QUEUE_NUM_MAX);
  if(max == 0)
    Assert(0, "virtio disk has no queue 0");
  if(max < NUM)
    Assert(0, "virtio disk max queue too short");

  // allocate and zero queue memory.
  disk.desc = alloc_physic_page();
  disk.avail = alloc_physic_page();
  disk.used = alloc_physic_page();
  if(!disk.desc || !disk.avail || !disk.used)
    Assert(0, "virtio disk kalloc");

  // set queue size.
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_QUEUE_NUM) = NUM;

  // write physical addresses.
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64_t)disk.desc;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64_t)disk.desc >> 32;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64_t)disk.avail;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64_t)disk.avail >> 32;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64_t)disk.used;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64_t)disk.used >> 32;

  // queue is ready.
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_QUEUE_READY) = 0x1;

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    disk.free[i] = 1;

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
  *VIRTIO0_MMIO_REG(VIRTIO_MMIO_STATUS) = status;

  Log("initialized fat32 disk");
}
