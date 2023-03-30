#include "stdc.h"
#include "debug.h"
#include "lib/stdio.h"
#include "lib/stdlib.h"
#include "process/cpu.h"

__attribute__ (( aligned(16) )) char boot_stack[4096];

void main() {
  Log("abc");
  printf("\
   ______   __   _                                  ____  _____\n\
  / ____/  / /  (_)___ ___  ____ ___  ___  _____   / __ \\/ ___/ \n\
 / / __   / /  / / __ `__ \\/ __ `__ \\/ _ \\/ ___/  / / / /\\__ \\ \n\
/ /_/ /  / /  / / / / / / / / / / / /  __/ /     / /_/ /___/ /  \n\
\\____/  /_/  /_/_/ /_/ /_/_/ /_/ /_/\\___/_/      \\____//____/  \n\n");
  int i = 1;
  printf("%d %s, %u\n, 00, %lu", i, "hello, world!\n", 12, -1);
  printf("\nthe address of i is %p; %ld\n", &i, -1234567890);
  printf("\e[31;3mcolor\e[0m\n");

  Assert(i == 0, "i is not equal to 1");
}
