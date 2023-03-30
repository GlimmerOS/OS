#ifndef _SPINLOCK_H
#define _SPINLOCK_H
#include "process/cpu.h"

struct spinlock {
  uint32_t locked;       // Is the lock held?
  // For debugging:
  char *name;        // Name of lock.
  struct cpu *cpu;   // The cpu holding the lock.
};

void init_lock(struct spinlock *lock, char *name);
void acquire(struct spinlock *lock);
void release(struct spinlock *lock);
int holding(struct spinlock *lock);
void push_off(void);
void pop_off(void);

#endif
