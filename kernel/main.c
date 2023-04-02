#include "stdc.h"
#include "debug.h"
#include "lib/stdio.h"
#include "lib/stdlib.h"
#include "process/cpu.h"
#include "memory/memory.h"

__attribute__ (( aligned(16) )) char boot_stack[4096];

void main() {
  print_glimmeros();
  
  init_physic_memory();
}
