#ifndef _MEMORY_H
#define _MEMORY_H

void init_physic_memory();
void* alloc_physic_page();
void free_physic_page(void *addr);

#endif
