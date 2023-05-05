#include "kernel.h"
#include "syscall/sysfunc.h"
#include "syscall/syscall.h"
#include "debug.h"
uint64_t sys_exec(void)
{
    char path[MAXPATH_LEN];
    argstr(0,path,MAXPATH_LEN);
    Log("1111");
    return 1;
}