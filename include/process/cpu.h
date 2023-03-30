#ifndef _CPU_H
#define _CPU_H
//高度参考xv6的定义
#include "lib/param.h"
#include "riscv64.h"

struct context {
  uint64_t ra;
  uint64_t sp;

  // callee-saved
  uint64_t s0;
  uint64_t s1;
  uint64_t s2;
  uint64_t s3;
  uint64_t s4;
  uint64_t s5;
  uint64_t s6;
  uint64_t s7;
  uint64_t s8;
  uint64_t s9;
  uint64_t s10;
  uint64_t s11;
};

struct cpu {
//   struct proc *proc;            // The process running on this cpu, or null.   没实现，暂时注释
  struct context context;     // swtch() here to enter scheduler().
  int noff;                   // Depth of push_off() nesting.
  int intena;                 // Were interrupts enabled before push_off()?
};

extern struct cpu cpus[NCPU];

void init_cpu();

int cpuid();

struct cpu* mycpu(void);

#endif