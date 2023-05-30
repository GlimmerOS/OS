#ifndef _VMLAYOUT_H
#define _VMLAYOUT_H

#include "pm.h"
#include "macro.h"

/// 虚拟地址的最大值
#define  VA_MAX SET_BIT(0, 38)

/// trampoline的虚拟地址
#define TRAMPOLINE (VA_MAX - PAGE_SIZE)

/// trapframe的虚拟地址
#define TRAPFRAME (TRAMPOLINE - PAGE_SIZE)

/// virtio memory mapping
#define VIRTIO0 0x10001000

#endif
