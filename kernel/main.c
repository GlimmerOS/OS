#include "stdc.h"
#include "debug.h"
#include "kernel.h"

__attribute__ (( aligned(16) )) char boot_stack[PAGE_SIZE];

static void env_init() {
  uint64_t hartid = READ_GRR(a0);
  WRITE_GRR(tp, hartid);

  WRITE_CSR(s, status, READ_CSR(s, status) | 0x2);
  WRITE_CSR(s, ie, 0x222);
}

void main() {
  env_init();

  int hartid = read_mhartid();
  if (hartid == 0) {
    print_glimmeros();

    Log("Starting GlimmerOS");
    
    physic_memory_init();
    kernel_pagetable_init();
  } else {
    while (1) {};
  }
}
