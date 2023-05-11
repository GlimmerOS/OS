.altmacro

.equ TRAPFRAME, 0x4000000000 - 0x2000
.equ XLEN, 8

.macro SAVE_REG reg, offset
  sd \reg, \offset * XLEN(a0)
.endm

.macro SAVE_N n
  SAVE_REG x\n, \n
.endm

.macro LOAD_REG reg, offset
  ld \reg, \offset * XLEN(a0)
.endm

.macro LOAD_N n
  LOAD_REG x\n, \n
.endm

.section trap_section
.globl trampoline
trampoline:
.align 4
.globl uservec
uservec:    
  # trap.c sets stvec to point here, so
  # traps from user space start here,
  # in supervisor mode, but with a
  # user page table.
  #

  # save user a0 in sscratch so
  # a0 can be used to get at TRAPFRAME.
  csrw sscratch, a0

  # each process has a separate p->trapframe memory area,
  # but it's mapped to the same virtual address
  # (TRAPFRAME) in every process's user page table.
  li a0, TRAPFRAME
  
  # save the user registers in TRAPFRAME
  .set n, 1
  .rept 31
    SAVE_N %n
    .set n, n + 1
  .endr

	# save the user a0 in p->trapframe->a0
  csrr t0, sscratch
  sd t0, 10 * XLEN(a0)

  # initialize kernel stack pointer, from p->trapframe->kernel_sp
  ld sp, 33 * XLEN(a0)

  # make tp hold the current hartid, from p->trapframe->kernel_hartid
  ld tp, 35 * XLEN(a0)

  # fetch the kernel page table address, from p->trapframe->kernel_satp.
  ld t1, 32 * XLEN(a0)

  # wait for any previous memory operations to complete, so that
  # they use the user page table.
  sfence.vma zero, zero

  # install the kernel page table.
  csrw satp, t1

  # flush now-stale user entries from the TLB.
  sfence.vma zero, zero

  # jump to usertrap(), which does not return
  j user_trap_handler

.globl userret
userret:
  # userret(pagetable)
  # called by usertrapret() in trap.c to
  # switch from kernel to user.
  # a0: user page table, for satp.

  # switch to the user page table.
  sfence.vma zero, zero
  csrw satp, a0
  sfence.vma zero, zero

  li a0, TRAPFRAME

  # restore all but a0 from TRAPFRAME
  .set n, 1
  .rept 9
    LOAD_N %n
    .set n, n + 1
  .endr

  .set n, 11
  .rept 21
    LOAD_N %n
    .set n, n + 1
  .endr

	# restore user a0
  LOAD_N 10
  
  # return to user mode and user pc.
  # usertrapret() set up sstatus and sepc.
  sret
