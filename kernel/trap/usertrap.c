#include "debug.h"
#include "kernel.h"
#include "macro.h"
#include "syscall/syscall.h"

extern char trampoline[];

/**
 * handle user trap
 *
 * @return void no return
 */
void user_trap_handler() {
  Assert(GET_BIT(READ_CSR(s, status), SSTATUS_SPP) == 0x0,
         "Trap not from user!");

  WRITE_CSR(s, tvec, (uint64_t)kernelvec);

  struct Process *myproc = myProcess();

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
    if (GET_EXCEPTION(scause) == SSC) {
      if (killed(myproc)) {
        exit(-1);
      }
      myproc->trapframe->epc += 4;
      intr_on();
      syscall();
    }
  }
  usertrapret();
}

void usertrapret() {
  struct Process *myproc = myProcess();

  intr_off();

  addr_t trampoline_uservec = TRAMPOLINE + ((addr_t)uservec - (addr_t)trampoline);
  WRITE_CSR(s, tvec, trampoline_uservec);

  myproc->trapframe->kernelSatp = READ_CSR(s, atp);
  myproc->trapframe->kernelSp = myproc->stack_inKenl + PAGE_SIZE;
  myproc->trapframe->kernelHartId = READ_GRR(tp);
  myproc->trapframe->kernel_usertrap = (uint64_t)user_trap_handler;

  uint64_t sstatus = READ_CSR(s, status);

  sstatus = CLEAR_BIT(sstatus, SSTATUS_SPP);
  sstatus = SET_BIT(sstatus, SSTATUS_SPIE);

  WRITE_CSR(s, status, sstatus);

  WRITE_CSR(s, epc, myproc->trapframe->epc);

  uint64_t satp = SET_SATP((uint64_t)myproc->pagetable);

  addr_t trampoline_userret = TRAMPOLINE + ((addr_t)userret - (addr_t)trampoline);
  ((void (*)(uint64_t))trampoline_userret)(satp);
}
