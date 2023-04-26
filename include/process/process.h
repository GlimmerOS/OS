#ifndef _PROCESS_H
#define _PROCESS_H

#include "lock/spinlock.h"
#include "memory/vm.h"
#include "memory/vmlayout.h"
#include "stdint.h"

#define PCB_NUM 40
#define Process_Stack(num) (TRAMPOLINE - (num + 1) * 2 * PAGE_SIZE)

enum ProcessState { UNUSED, READY, RUNNING, SLEEPING, ZOMBIE };

struct Process {
  struct spinlock lock;
  uint64_t processID;
  pagetable_t pagetable;
  enum ProcessState state;
  struct Trapframe *trapframe;
  uint64_t parentId;
  void *chan;
  uint32_t killed;
  uint64_t stack_inKenl;
};

struct PCB {
  struct Process process[PCB_NUM];
  struct spinlock lock;
};

void processSetup(struct Process *process);
void processesInit();
struct Process *allocProcess();
void processFirstRun();
struct Process *myProcess();
void scheduler();
void switch2Scheduler();
void processPgtableAlloc(struct Process *process);
void yield(void);
void sleep(void *chan, struct spinlock *lk);
void wakeup(void *chan);
int kill(int pid);

#endif
