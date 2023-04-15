#include "common.h"
#include "kernel.h"
#include "debug.h"

void kernelvec();

void kernel_trap_init() {
  Log("Set stvec");
  WRITE_CSR(s, tvec, (uint64_t)kernelvec);
}

void kernel_trap_handler() {
  Log("scause: %ld", READ_CSR(s, cause));
  Log("sstatus: %ld", READ_CSR(s, status));
}
