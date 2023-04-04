#ifndef _VM_H
#define _VM_H

#include "common.h"
#include "stdint.h"

// virtual address
/// 获取虚拟地址对应级别的虚拟页面号
#define VA_VPN(x, lev) BITS(x, 20 + lev * 9, 12 + lev * 9)
/// 获取虚拟地址的偏移量
#define VA_PO(x) BITS(x, 11, 0)

// physical address
/// 获取物理地址的物理页面的起始地址
#define PA_PPN(x) (BITS(x, 55, 12) << 12)
/// 获取物理地址的偏移量
#define PA_PO(x) BITS(x, 11, 0)

// PTE
/// 获取PTE中的物理页面起始地址
#define PTE_PPN(x) (BITS(x, 53, 10) << 10)

#define _D 7
#define _A 6
#define _G 5
#define _U 4
#define _X 3
#define _W 2
#define _R 1
#define _V 0
/// 获取PTE的标志位
#define GPTE_FLAG(x, tag) GET_BIT(x, _ ## tag)
/// 获取PTE的标志位
#define GPTE_FLAGS(x) BITS(x, 9, 0)
/// 设置PTE的标志位
#define SPTE_FLAG(x, tag) SET_BIT(x, _ ## tag)
/// 设置PTE的标志位
#define SPTE_FLAGS(x, flags) (x | GPTE_FLAGS(flags))

typedef uint64_t *pagetable_t;
typedef uint64_t pte_t;

#endif
