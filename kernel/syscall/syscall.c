#include "debug.h"
#include "kernel.h"
#include "lib/string.h"
#include "syscall/syscall.h"

extern uint64_t sys_exec(void);
static uint64_t argGet(int n) {
  struct Process *process = myProcess();
  switch (n) {
  case 0:
    return process->trapframe->a0;
    break;
  case 1:
    return process->trapframe->a1;
    break;
  case 2:
    return process->trapframe->a2;
    break;
  case 3:
    return process->trapframe->a3;
    break;
  case 4:
    return process->trapframe->a4;
    break;
  case 5:
    return process->trapframe->a5;
    break;
  default:
    Assert(0, "argeGet:no suitable num");
  }

  return 0;
}

int getStrFmAddr(uint64_t addr, char *buf, int max) {
  struct Process *p = myProcess();
  if (copy_in_str_u2k(p->pagetable, buf, addr, max) < 0)
    return -1;
  return strlen(buf);
}

void argint(int n, int *arg) { *arg = argGet(n); }

void argaddr(int n, uint64_t *arg) { *arg = argGet(n); }

int argstr(int n, char *buf, int max) {
  uint64_t addr;
  argaddr(n, &addr);
  return getStrFmAddr(addr, buf, max);
}

static uint64_t (*syscalls[])(void) = {[SYS_exec] = sys_exec};

void syscall(void) {
  int num;
  struct Process *process = myProcess();
  num = process->trapframe->a7;
  if (num > 0 && syscalls[num]) // here num can up to an uncorret height,it will
                                // be wrong,not now
  {
    process->trapframe->a0 = syscalls[num]();
  } else {
    printf("%d %s :unknown syscall,syscall num:%d", process->processID,
           process->name, num);
    process->trapframe->a0 = -1;
  }
}
