#ifndef _CPU_H
#define _CPU_H

#include "riscv64.h"

/// CPU的数量
#define NCPU 1

struct Trapframe {
  uint64_t zero;
  uint64_t ra;
  uint64_t sp;
  uint64_t gp;
  uint64_t tp;
  uint64_t t0;
  uint64_t t1;
  uint64_t t2;
  uint64_t s0;
  uint64_t s1;
  uint64_t a0;
  uint64_t a1;
  uint64_t a2;
  uint64_t a3;
  uint64_t a4;
  uint64_t a5;
  uint64_t a6;
  uint64_t a7;
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
  uint64_t t3;
  uint64_t t4;
  uint64_t t5;
  uint64_t t6;
  uint64_t kernelSatp;   // 32
  uint64_t kernelSp;     // 33
  uint64_t epc;          // 34
  uint64_t kernelHartId; // 35
};

struct cpu {
  struct Process
      *process; // The process running on this cpu, or null.   没实现，暂时注释
  struct Trapframe *trapframe; // swtch() here to enter scheduler().
  int noff;                    // Depth of push_off() nesting.
  int intena;                  // Were interrupts enabled before push_off()?
};

extern struct cpu cpus[NCPU];

void init_cpu();
int cpuid();
struct cpu *mycpu(void);

#endif
