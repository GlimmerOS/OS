#include "kernel.h"
#include "common.h"
#include "debug.h"

void user_trap_handler() {
  Assert(GET_BIT(READ_CSR(s, status), SSTATUS_SPP) == 0x0, "Trap not from user!");
}
