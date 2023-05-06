#ifndef _CPU_H
#define _CPU_H

#include "riscv64.h"

/// CPU的数量
#define NCPU 1

struct Trapframe {
  uint64_t zero;//0
  uint64_t ra;//8
  uint64_t sp;//16
  uint64_t gp;//24
  uint64_t tp;//32
  uint64_t t0;//40
  uint64_t t1;//48
  uint64_t t2;//56
  uint64_t s0;//64
  uint64_t s1;//72
  uint64_t a0;//80
  uint64_t a1;//88
  uint64_t a2;//96
  uint64_t a3;//104
  uint64_t a4;//112
  uint64_t a5;//120
  uint64_t a6;//128
  uint64_t a7;//136
  uint64_t s2;//144
  uint64_t s3;//152
  uint64_t s4;//160
  uint64_t s5;//168
  uint64_t s6;//176
  uint64_t s7;//184
  uint64_t s8;//192
  uint64_t s9;//200
  uint64_t s10;//208
  uint64_t s11;//216
  uint64_t t3;//224
  uint64_t t4;//232
  uint64_t t5;//
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
