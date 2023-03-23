# Workspace
WORKDIR = $(abspath .)

# Try to infer the correct TOOLPREFIX if not set
ifndef TOOLPREFIX
TOOLPREFIX := $(shell if riscv64-unknown-elf-objdump -i 2>&1 | grep 'elf64-big' >/dev/null 2>&1; \
	then echo 'riscv64-unknown-elf-'; \
	elif riscv64-linux-gnu-objdump -i 2>&1 | grep 'elf64-big' >/dev/null 2>&1; \
	then echo 'riscv64-linux-gnu-'; \
	elif riscv64-unknown-linux-gnu-objdump -i 2>&1 | grep 'elf64-big' >/dev/null 2>&1; \
	then echo 'riscv64-unknown-linux-gnu-'; \
	else echo "***" 1>&2; \
	echo "*** Error: Couldn't find a riscv64 version of GCC/binutils." 1>&2; \
	echo "*** To turn off this error, run 'gmake TOOLPREFIX= ...'." 1>&2; \
	echo "***" 1>&2; exit 1; fi)
endif
# Then get the tools' name
CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

# Kernel and user space source codes dir
K = $(WORKDIR)/kernel
U = $(WORKDIR)/user

# QEMU options
QEMU = qemu-system-riscv64

MACHINE = virt
BIOS = default
MEMORYSIZE = 128M

QEMUFLAGS = -machine $(MACHINE) \
						-bios $(BIOS) \
						-m $(MEMORYSIZE) \
						-nographic

# C compile options
CFLAGS = -Wall -Werror -ggdb \
				 -MD \
				 -ffreestanding -fno-common -nostdlib -mno-relax
INCLUDEPATH = $(WORKDIR)/include
CFLAGS += $(addprefix -I, $(INCLUDEPATH))

# kernel info
KERNELENTRY = entry

KERNELSRC = $(shell find $(WORKDIR)/kernel -name "*.c")
KERNELOBJ = $(K)/$(KERNELENTRY).o
KERNELOBJ += $(KERNELSRC:%.c=%.o)
-include $(KERNELSRC:%.c:%.d)
KERNELBIN = $(K)/kernel
KERNELLD = $(K)/kernel.ld

# user info
USERSRC = $(shell find $(WORKDIR)/user -name "*.c")
USEROBJ = $(USERSRC:%.c=%.o)
-include $(USERSRC:%.c:%.d)

# build kernel
$(KERNELBIN): $(KERNELOBJ) $(KERNELLD)
	$(LD) $(LDFLAGS) -T $(KERNELLD) -o $@ $(KERNELOBJ)

# run qemu
run: $(KERNELBIN)
	$(QEMU) $(QEMUFLAGS) -kernel $^

# debug options
QEMUGDBFLAGS = -S -gdb \
							 tcp::26000

# run debug
gdb: $(KERNELBIN)
	@grep -E "set auto-load safe-path /" ~/.gdbinit || echo "set auto-load safe-path /" >> ~/.gdbinit
	@echo "**********Start riscv64-unknown-linux-gnu-gdb on another window"
	$(QEMU) $(QEMUFLAGS) -kernel $(KERNELBIN) $(QEMUGDBFLAGS) 

# clean project not needed files
clean:
	rm -f $(KERNELOBJ) $(USEROBJ) $(KERNELOBJ:%.o=%.d) $(USEROBJ:%.o:%.d) $(KERNELBIN)

.PHONY: clean run gdb
