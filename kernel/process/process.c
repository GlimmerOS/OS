#include "debug.h"
#include "kernel.h"
#include "stdc.h"

static uint32_t pid;
struct PCB PCB;
struct spinlock wait_lock;
struct Process *initproc;
extern char trampoline[];
extern void swtch(struct Trapframe *old, struct Trapframe *new);

void processSetup(struct Process *process) {
  Log("Process init...");

  process->processID = pid++;
  processPgtableAlloc(process);

  Assert(process->pagetable, "processInitFail:pagetable disalloc");

  Assert(process->trapframe = (struct Trapframe *)alloc_physic_page(), "processInitFail:trapFrame disalloc");

  memset(process->trapframe, 0, sizeof(struct Trapframe));
  process->trapframe->ra = (uint64_t)processFirstRun;
  process->trapframe->sp = process->stack_inKenl + PAGE_SIZE;

  process->chan = 0;
  process->state = READY;   
}

void processesInit() {
  Log("Processes first init ...");

  struct Process *process;
  pid = 0;

  init_lock(&PCB.lock, "PCBs");
  init_lock(&wait_lock,"wait_lock");
  for (process = PCB.process; process < &PCB.process[PCB_NUM]; process++) {
    init_lock(&process->lock, "process_each");
    process->state = UNUSED;
    process->stack_inKenl = Process_Stack(process - PCB.process);
  }
 Log("scheduler loaded in cpu ...");
 mycpu()->trapframe=alloc_physic_page();
  mycpu()->trapframe->ra = (uint64_t)scheduler;
  mycpu()->trapframe->kernelSp=Process_Stack(PCB_NUM);
  Log("Finish Processes first init ...");
}

struct Process *allocProcess() {
  struct Process *p;

  acquire(&PCB.lock);
  for (p = PCB.process; p < &PCB.process[PCB_NUM]; p++) {
    acquire(&p->lock);

    if (p->state == UNUSED) {
      processSetup(p);
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
   Log("i'm the first code process run,its uncomplete");
  // here a func to return from kernel to user space is needed.
}

uint8_t initcode[] = {
  0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x45, 0x02,
  0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x35, 0x02,
  0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
  0x93, 0x08, 0x20, 0x00, 0x73, 0x00, 0x00, 0x00,
  0xef, 0xf0, 0x9f, 0xff, 0x2f, 0x69, 0x6e, 0x69,
  0x74, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00
};

void
userinit(void)
{
  Log("the init user process init start");
  struct Process *process;

  process = allocProcess();
  initproc = process;
  
  userFstCodeLoad(process->pagetable, initcode, sizeof(initcode));
  // p->sz = PGSIZE;

  // prepare for the very first "return" from kernel to user.
  process->trapframe->epc = 0;      // user program counter
  process->trapframe->sp = PAGE_SIZE;  // user stack pointer
  memcpy(process->name, "initcode", sizeof(process->name));
  // p->cwd = namei("/");
  process->state = READY;
  release(&process->lock);
  Log("the init user process init finish");
}

struct Process *myProcess() {
  return mycpu()->process;
}

void scheduler() {
  struct Process *process;
  struct cpu *cpu = mycpu();
    cpu->process=0;
  while (1) {
    for (process = PCB.process; process-PCB.process <PCB_NUM; process++) {
      acquire(&process->lock);
      if (process->state == READY) {
        process->state = RUNNING;
        cpu->process = process;
        swtch(cpu->trapframe, process->trapframe);
        cpu->process=0;
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
static void freeProcess(struct Process *process)
{
      if(process->trapframe)
    free_physic_page((void*)process->trapframe);
       process->trapframe=0;
   free_pagetable(process->pagetable);
    process->chan=0;
    process->processID=0;
    process->killed=0;
    process->state=UNUSED;
}

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

static void
reparent(struct Process *p)
{
  struct Process *pp;

  for(pp = PCB.process; pp < &PCB.process[PCB_NUM]; pp++){
    if(pp->parent == p){
      pp->parent = initproc;
    }
     wakeup(initproc);
  }
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
  struct Process *p = myProcess();

  if(p == initproc)
    Assert(0,"init exiting");

  // Close all open files.

  // for(int fd = 0; fd < NOFILE; fd++){
  //   if(p->ofile[fd]){
  //     struct file *f = p->ofile[fd];
  //     fileclose(f);
  //     p->ofile[fd] = 0;
  //   }
  // }

  // begin_op();
  // iput(p->cwd);
  // end_op();
  // p->cwd = 0;

  acquire(&wait_lock);

  // Give any children to init.
  reparent(p);

  // Parent might be sleeping in wait().
  wakeup(p->parent);
  
  acquire(&p->lock);

  p->exit_state = status;
  p->state = ZOMBIE;

  release(&wait_lock);

  // Jump into the scheduler, never to return.
  switch2Scheduler();
 Assert(0,"zombie exit");
}

int wait(uint64_t addr)
{
  struct Process *pp;
  int havekids, pid;
  struct Process *p = myProcess();

  acquire(&wait_lock);

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(pp = PCB.process; pp < &PCB.process[PCB_NUM]; pp++){
      if(pp->parent == p){
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);

        havekids = 1;
        if(pp->state == ZOMBIE){
          // Found one.
          pid = pp->processID;
          // if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
          //                         sizeof(pp->xstate)) < 0) {
          //   release(&pp->lock);
          //   release(&wait_lock);
          //   return -1;
          // }
          freeProcess(pp);
          release(&pp->lock);
          release(&wait_lock);
          return pid;
        }
        release(&pp->lock);
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
      release(&wait_lock);
      return -1;
    }
      release(&p->lock);
    // Wait for a child to exit.
    sleep(p, &wait_lock);  
  }
}
int killed(struct Process *process)
{
  int k;
  acquire(&process->lock);
  k=process->killed;
  release(&process->lock);
  return k;

}
int fork(void)
{
  int  pid;
  struct Process *np;
  struct Process *p = myProcess();

  // Allocate process.
  if((np = allocProcess()) == 0){
    return -1;
  }

  // Copy user memory from parent to child.

  // if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
  //   freeProcess(np);
  //   release(&np->lock);
  //   return -1;
  // }

  // np->sz = p->sz;

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;

  // for(i = 0; i < P_FLIE_NUM; i++)
  //   if(p->ofile[i])
  //     np->ofile[i] = filedup(p->ofile[i]);

  // np->cwd = icnt_up(p->cwd);

  memcpy(np->name, p->name, sizeof(p->name));

  pid = np->processID;

  release(&np->lock);

  acquire(&wait_lock);
  np->parent = p;
  release(&wait_lock);

  acquire(&np->lock);
  np->state = READY;
  release(&np->lock);

  return pid;
}