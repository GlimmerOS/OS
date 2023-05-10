#include "debug.h"
#include "kernel.h"
#include "syscall/syscall.h"
#include "syscall/sysfunc.h"

uint64_t sys_exec(void) {
  char path[MAXPATH_LEN];
  argstr(0, path, MAXPATH_LEN);
  Log("1111");
  return 1;
}
