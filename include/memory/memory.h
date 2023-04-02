#ifndef _MEMORY_H
#define _MEMORY_H

// kinit
void init_physic_memory();
// kalloc
void* alloc_physic_page();
// kfree
void free_physic_page(void *addr);

#endif
