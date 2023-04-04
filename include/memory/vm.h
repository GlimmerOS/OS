#ifndef _VM_H
#define _VM_H

#include "common.h"

// virtual address
/// 获取虚拟地址对应级别的虚拟页面号
#define VA_VPN(x, lev) BITS(x, 20 + lev * 9, 12 + lev * 9)
/// 获取虚拟地址的偏移量
#define VA_PO(x) BITS(x, 11, 0)

// physical address
/// 获取物理地址的物理页面号
#define PA_PPN(x) BITS(x, 55, 12)
/// 获取物理地址的偏移量
#define PA_PO(x) BITS(x, 11, 0)

// PTE
/// 获取PTE中的物理页面号
#define PTE_PPN(x) BITS(x, 53, 10)
/// 获取PTE的D位
#define PTE_D(x) BIT(x, 7)
/// 获取PTE的A位
#define PTE_A(x) BIT(x, 6)
/// 获取PTE的G位
#define PTE_G(x) BIT(x, 5)
/// 获取PTE的U位
#define PTE_U(x) BIT(x, 4)
/// 获取PTE的X位
#define PTE_X(x) BIT(x, 3)
/// 获取PTE的W位
#define PTE_W(x) BIT(x, 2)
/// 获取PTE的R位
#define PTE_R(x) BIT(x, 1)
/// 获取PTE的V位
#define PTE_v(x) BIT(x, 0)


#endif
