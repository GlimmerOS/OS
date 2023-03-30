#include "process/cpu.h"

struct cpu cpus[NCPU];

int test = 1;

//读取当前硬件线程的id，即hartid，并返回
int cpuid()
{
  return read_mhartid();
}

//返回当前cpu（即hart）的引用
struct cpu* mycpu(void)
{
  return &cpus[cpuid()];
}

//初始化cpu状态
void init_cpu() {
  for (int i = 0; i < NCPU; i++)
  {
    // cpus[i].proc = NULL;
    cpus[i].intena = 0;
    cpus[i].noff = 0;
  }
}