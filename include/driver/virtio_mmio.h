#ifndef _VIRTIO_MMIO_H
#define _VIRTIO_MMIO_H

// register memory mapping
#define VIRTIO_MMIO_MAGIC_VALUE		0x000 // 0x74726976
#define VIRTIO_MMIO_VERSION		0x004 // version; should be 2
#define VIRTIO_MMIO_DEVICE_ID		0x008 // device type; 1 is net, 2 is disk
#define VIRTIO_MMIO_VENDOR_ID		0x00c // 0x554d4551
#define VIRTIO_MMIO_DEVICE_FEATURES	0x010
#define VIRTIO_MMIO_DRIVER_FEATURES	0x020
#define VIRTIO_MMIO_QUEUE_SEL		0x030 // select queue, write-only
#define VIRTIO_MMIO_QUEUE_NUM_MAX	0x034 // max size of current queue, read-only
#define VIRTIO_MMIO_QUEUE_NUM		0x038 // size of current queue, write-only
#define VIRTIO_MMIO_QUEUE_READY		0x044 // ready bit
#define VIRTIO_MMIO_QUEUE_NOTIFY	0x050 // write-only
#define VIRTIO_MMIO_INTERRUPT_STATUS	0x060 // read-only
#define VIRTIO_MMIO_INTERRUPT_ACK	0x064 // write-only
#define VIRTIO_MMIO_STATUS		0x070 // read/write
#define VIRTIO_MMIO_QUEUE_DESC_LOW	0x080 // physical address for descriptor table, write-only
#define VIRTIO_MMIO_QUEUE_DESC_HIGH	0x084
#define VIRTIO_MMIO_DRIVER_DESC_LOW	0x090 // physical address for available ring, write-only
#define VIRTIO_MMIO_DRIVER_DESC_HIGH	0x094
#define VIRTIO_MMIO_DEVICE_DESC_LOW	0x0a0 // physical address for used ring, write-only
#define VIRTIO_MMIO_DEVICE_DESC_HIGH	0x0a4

#endif
