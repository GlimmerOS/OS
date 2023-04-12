#include "stdc.h"
#include "debug.h"
#include "kernel.h"

__attribute__ (( aligned(16) )) char boot_stack[4096];

static void env_init() {
  WRITE_CSR(s, ie, 0x222);
}

void main() {
  env_init();

  print_glimmeros();

  Log("Starting GlimmerOS");
  
  physic_memory_init();
  kernel_pagetable_init();
}
