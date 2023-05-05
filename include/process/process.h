#ifndef _PROCESS_H
#define _PROCESS_H

#include "lock/spinlock.h"
#include "memory/vm.h"
#include "memory/vmlayout.h"
#include "stdint.h"

#define PCB_NUM 40
#define P_FLIE_NUM 15
#define Process_Stack(num) (TRAMPOLINE - (num + 1) * 2 * PAGE_SIZE)

enum ProcessState { UNUSED, READY, RUNNING, SLEEPING, ZOMBIE };

struct Process {
  struct spinlock lock;
  uint64_t processID;
  pagetable_t pagetable;
  enum ProcessState state;
  int exit_state;
  struct Trapframe *trapframe;
  struct Process *parent;
  void *chan;
  uint32_t killed;
  uint64_t stack_inKenl;
  void * cwd; //uncomplete
  char name[16]; //for debugging

};

struct PCB {
  struct Process process[PCB_NUM];
  struct spinlock lock;
};

void processSetup(struct Process *process);
void processesInit();
void userinit(void);
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
void exit(int status);
int wait(uint64_t addr);
int killed(struct Process *process);
int fork(void);
#endif
