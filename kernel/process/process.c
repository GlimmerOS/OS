#include "debug.h"
#include "kernel.h"
#include "stdc.h"

static uint32_t pid;
struct PCB PCB;

extern char trampoline[];
extern void swtch(struct Trapframe *old, struct Trapframe *new);

void processSetup(struct Process *process) {
  Log("Process init...");

  acquire(&process->lock);
  process->processID = pid++;
  processPgtableAlloc(process);

  Assert(process->pagetable, "processInitFail:pagetable disalloc");

  Assert((process->trapframe = (struct Trapframe *)alloc_physic_page()) == 0, "processInitFail:trapFrame disalloc");

  memset(process->trapframe, 0, sizeof(struct Trapframe));
  process->trapframe->ra = (uint64_t)processFirstRun;
  process->trapframe->sp = process->stack_inKenl + PAGE_SIZE;

  process->chan = 0;
  process->state = READY;

  release(&process->lock);
}

void processesInit() {
  Log("Processes first init ...");

  struct Process *process;
  pid = 0;

  init_lock(&PCB.lock, "PCBs");

  for (process = PCB.process; process < &PCB.process[PCB_NUM]; process++) {
    init_lock(&process->lock, "process_each");
    process->state = UNUSED;
    process->stack_inKenl = Process_Stack(process - PCB.process);
  }

  mycpu()->trapframe->ra = (uint64_t)scheduler;
  // mycpu()->trapframe.kernelSp=
}

struct Process *allocProcess() {
  struct Process *p;

  acquire(&PCB.lock);
  for (p = PCB.process; p < &PCB.process[PCB_NUM]; p++) {
    acquire(&p->lock);

    if (p->state == UNUSED) {
      processSetup(p);
      release(&p->lock);
      release(&PCB.lock);
      return p;
    }

    release(&p->lock);
  }

  release(&PCB.lock);
  return 0;
}

void processFirstRun() {
  release(&myProcess()->lock);
  // here a func to return from kernel to user space is needed.
}

struct Process *myProcess() {
  return mycpu()->process;
}

void scheduler() {
  struct Process *process;
  struct cpu *cpu = mycpu();

  while (1) {
    for (process = PCB.process; process < PCB.process; process++) {
      acquire(&process->lock);
      if (process->state == UNUSED) {
        process->state = RUNNING;
        cpu->process = process;
        swtch(cpu->trapframe, process->trapframe);
      }
      release(&process->lock);
    }
  }
}

void switch2Scheduler() {
  struct Process *process = myProcess();
  int intena;

  if (!holding(&process->lock)) {
    Assert(0, "switch2Scheduler:proccess lock unheld");
  }

  if (process->state == RUNNING) {
    Assert(0, "myProcess is still running");
  }

  intena = mycpu()->intena;
  swtch(process->trapframe, mycpu()->trapframe);
  mycpu()->intena = intena;
}

void processPgtableAlloc(struct Process *process) {
  // An empty page table.
  process->pagetable = alloc_physic_page();
  if (process->pagetable == 0)
    Assert(0, "process pgtable Alloc fail");

  if (va_map_pa(process->pagetable, TRAMPOLINE, (uint64_t)trampoline,
                MPTE_FLAG(R) | MPTE_FLAG(W)) < 0) {
    va_unmap_pa(process->pagetable, TRAMPOLINE);
    free_physic_page(process->pagetable);
    Assert(0, "TRAMPOLINE map failed");
  }

  if (va_map_pa(process->pagetable, TRAPFRAME, (uint64_t)(process->trapframe),
                MPTE_FLAG(R) | MPTE_FLAG(W)) < 0) {
    va_unmap_pa(process->pagetable, TRAMPOLINE);
    va_unmap_pa(process->pagetable, TRAPFRAME);
    free_physic_page(process->pagetable);
    Assert(0, "TRAPFRAME map failed");
  }
}
// static void freeproc(Process *process)
// {
//       if(process->trapframe)
//     free_physic_page((void*)process->trapframe);
//        process->trapframe=0;
//     va_unmap_pa(process->pagetable,TRAPFRAME);
//     va_unmap_pa(process->pagetable,TRAMPOLINE);
//     free_physic_page((void));
//     process->chan=0;
//     process->processID=0;
//     process->killed=0;
//     process->state=UNUSED;

// }

void yield(void) {
  Log("yield");
  struct Process *process = myProcess();
  acquire(&process->lock);
  process->state = READY;
  switch2Scheduler();
  release(&process->lock);
}

void sleep(void *chan, struct spinlock *lk) {
  struct Process *process = myProcess();

  // Must acquire p->lock in order to
  // change p->state and then call switch2Scheduler.
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&process->lock); // DOC: sleeplock1
  release(lk);

  // Go to sleep.
  process->chan = chan;
  process->state = SLEEPING;

  switch2Scheduler();

  // Tidy up.
  process->chan = 0;

  // Reacquire original lock.
  release(&process->lock);
  acquire(lk);
}

void wakeup(void *chan) {
  struct Process *process;

  for (process = PCB.process; process < &PCB.process[PCB_NUM]; process++) {
    if (process != myProcess()) {
      acquire(&process->lock);

      if (process->state == SLEEPING && process->chan == chan) {
        process->state = READY;
      }

      release(&process->lock);
    }
  }
}

int kill(int pid) {
  struct Process *process;

  for (process = PCB.process; process < &PCB.process[PCB_NUM]; process++) {
    acquire(&process->lock);

    if (process->processID == pid) {
      process->killed = 1;

      if (process->state == SLEEPING) {
        // Wake process from sleep().
        process->state = READY;
      }

      release(&process->lock);
      return 0;
    }

    release(&process->lock);
  }

  return -1;
}
