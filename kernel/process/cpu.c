#include "process/cpu.h"

struct cpu cpus[NCPU];

int test = 1;


int cpuid()
{
  return read_mhartid();
}

struct cpu* mycpu(void)
{
  return &cpus[cpuid()];
}