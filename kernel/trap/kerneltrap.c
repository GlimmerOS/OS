#include "common.h"
#include "kernel.h"
#include "debug.h"
#include "lib/legacysbi.h"

#define INTERRUPT_TIME 0x100000l

static uint64_t read_time() {
  return READ_CSR(, time);
}

static void set_next_timer() {
  sbi_set_timer(read_time() + INTERRUPT_TIME);
}

void kernelvec();

void kernel_trap_init() {
  Log("Set stvec");
  WRITE_CSR(s, tvec, (uint64_t)kernelvec);
  Log("Finish set stvec");
  
  set_next_timer();
}

void kernel_trap_handler() {
  uint64_t scause = READ_CSR(s, cause);

  if (scause == 0x8000000000000005) {
    Log("Timer Interrupt!");
    set_next_timer();
  }
}
