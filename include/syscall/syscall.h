#ifndef _SYSCALL_H
#define _SYSCALL_H

#include <stdint.h>

#define SYS_exec 7

int getStrFmAddr(uint64_t addr, char *buf, int max);
void argint(int n,int *arg);
void argaddr(int n, uint64_t *arg);
int argstr(int n, char *buf, int max);
void syscall(void);

#endif
