#ifndef _SPINLOCK_H
#define _SPINLOCK_H

#include "process/cpu.h"

struct spinlock {
  uint32_t locked; // Is the lock held?
  // For debugging:
  char *name;      // Name of lock.
  struct cpu *cpu; // The cpu holding the lock.
};

void init_lock(struct spinlock *lock, char *name);
void acquire(struct spinlock *lock);
void release(struct spinlock *lock);
int holding(struct spinlock *lock);
void push_off(void);
void pop_off(void);

/*
 * intr_get、intr_off和intr_on都只对sstatus中的SIE位操作
 * intr_get就是获取是否禁止中断，1为开启中断 0为禁止中断
 */
static inline int intr_get() {
  uint64_t x = READ_CSR(s, status);
  return (x & SSTATUS_SIE) != 0;
}

/*
 * intr_off 将 SIE位 置为禁止中断(0)
 */
static inline void intr_off() {
  WRITE_CSR(s, status, READ_CSR(s, status) & ~SSTATUS_SIE);
}

/*
 * intr_on 将 SIE位 置为开启中断(1)
 */
static inline void intr_on() {
  WRITE_CSR(s, status, READ_CSR(s, status) | SSTATUS_SIE);
}

#endif
