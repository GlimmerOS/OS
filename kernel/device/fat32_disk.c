#include "kernel.h"
#include "debug.h"
#include "common.h"

/// the address of virtio mmio register r.
#define VIRTIO0_MMIO_REG(r) ((volatile uint32_t *)(VIRTIO0 + (r)))

void fat32_disk_init() {
}
