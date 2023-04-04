#ifndef _PM_H
#define _PM_H

/// 页表大小
#define PAGE_SIZE 0x1000
/// 获得页表的起始地址
#define PAGE_START(x) ((x) & ~0xfff)
/// 获得下一个页表的起始地址
#define PAGE_UP(x) PAGE_START(x + PAGE_SIZE)
/// 获取上一个页表的起始地址
#define PAGE_DOWN(x) PAGE_START(x - PAGE_SIZE)

/// 可用物理地址的最大值
#define PHYSIC_MEM_TOP 0x88000000

// kinit
void init_physic_memory();
// kalloc
void* alloc_physic_page();
// kfree
void free_physic_page(void *addr);

#endif
