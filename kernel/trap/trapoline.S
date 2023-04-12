#include "memory/vmlayout.h"

.section trap_section
.global trampoline
.align 4
.global uservec
uservec:
  add x0, x0, 0
