#include "common.h"
#include "kernel.h"
#include "debug.h"
#include "lib/legacysbi.h"

// timer gap
#define INTERRUPT_TIME 0x100000l

/**
 * read current time
 *
 * @return uint64_t current time
 */
static uint64_t read_time() {
  return READ_CSR(, time);
}

/**
 * set next timer_interrupt time
 *
 * @return void no return
 */
static void set_next_timer() {
  sbi_set_timer(read_time() + INTERRUPT_TIME);
}

/**
 * initialize kernel_trap
 *
 * @return void no return
 */
void kernel_trap_init() {
  Log("Set stvec");
  WRITE_CSR(s, tvec, (uint64_t)kernelvec);
  Log("Finish set stvec");
  
  set_next_timer();
}

/**
 * handle the kernel trap
 *
 * @return void no return
 */
void kernel_trap_handler() {
  Assert(GET_BIT(READ_CSR(s, status), SSTATUS_SPP) == 0x1, "Trap not from kernel!");

  uint64_t scause = READ_CSR(s, cause);

  if (GET_INTERRUPT(scause)) {
    // kernel interrupt

    uint64_t exception = GET_EXCEPTION(scause);

    if (exception == STI) {
      Log("Timer Interrupt!");
      set_next_timer();
    }
  }
}
