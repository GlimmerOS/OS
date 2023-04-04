#ifndef _PM_H
#define _PM_H

#define PAGE_SIZE 0x1000
#define PAGE_START(x) ((x) & ~0xfff)
#define PAGE_UP(x) PAGE_START(x + PAGE_SIZE)
#define PAGE_DOWN(x) PAGE_START(x - PAGE_SIZE)

#define PHYSIC_MEM_TOP 0x88000000

// kinit
void init_physic_memory();
// kalloc
void* alloc_physic_page();
// kfree
void free_physic_page(void *addr);

#endif
