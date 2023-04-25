#include "kernel.h"
#include "common.h"
#include "debug.h"

void user_trap_handler() {
  Assert(GET_BIT(READ_CSR(s, status), SSTATUS_SPP) == 0x0, "Trap not from user!");

  WRITE_CSR(s, tvec, (uint64_t)kernelvec);

  struct Process* myproc = myProcess();

  myproc->trapframe->epc = READ_CSR(s, epc);

  uint64_t scause = READ_CSR(s, cause);

  if (GET_INTERRUPT(scause)) {
    // an interrupt
    if (GET_EXCEPTION(scause) == STI) {
      timer_handler();
      yield();
    }
  } else {
    // not an interrupt
  }
}
