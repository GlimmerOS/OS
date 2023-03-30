#ifndef _RISCV64_H
#define _RISCV64_H

#include "stdint.h"

#define SSTATUS_SIE (1L << 1) //S-mode中断位

static inline uint64_t
read_mhartid()
{
  uint64_t x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
  return x;
}

/* static inline uint64_t r_ra() {
  uint64_t ret;

  asm volatile ("mv %0, ra" : "=r"(ret));

  return ret;
} */
static inline uint64_t
r_sstatus()
{
  uint64_t x;
  asm volatile("csrr %0, sstatus" : "=r" (x) );
  return x;
}
static inline void 
w_sstatus(uint64_t x)
{
  asm volatile("csrw sstatus, %0" : : "r" (x));
}

/*
* intr_get、intr_off和intr_on都只对sstatus中的SIE位操作
* intr_get就是获取是否禁止中断，1为开启中断 0为禁止中断
*/
static inline int
intr_get()
{
  uint64_t x = r_sstatus();
  return (x & SSTATUS_SIE) != 0;
}

//读取tp寄存器
static inline uint64_t
read_tp()
{
  uint64_t x;
  asm volatile("mv %0, tp" : "=r" (x) );
  return x;
}

/*
* intr_off 将 SIE位 置为禁止中断(0)
*/
static inline void
intr_off()
{
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
}

/*
* intr_on 将 SIE位 置为开启中断(1)
*/
static inline void
intr_on()
{
  w_sstatus(r_sstatus() | SSTATUS_SIE);
}

#endif
