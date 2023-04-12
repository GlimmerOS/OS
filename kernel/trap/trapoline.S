.section trap_section
.global trampoline
trampoline:
.align 4
.global uservec
uservec:
  add x0, x0, 0
