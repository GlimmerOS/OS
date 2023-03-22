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

QEMUGDBFLAGS = -S -gdb \
							 tcp::26000

CFLAGS = -Wall -Werror -ggdb \
				 -MD

KERNELENTRY = entry

KERNELSRC = $(shell find $(WORKDIR)/kernel -name "*.c")
KERNELOBJ = $(KERNELSRC:%.c=%.o)
KERNELOBJ += $(K)/$(KERNELENTRY).o
-include $(KERNELSRC:%.c:%.d)
KERNELBIN = $(K)/kernel
KERNELLD = $(K)/kernel.ld

USERSRC = $(shell find $(WORKDIR)/user -name "*.c")
USEROBJ = $(USERSRC:%.c=%.o)
-include $(USERSRC:%.c:%.d)

$(KERNELBIN): $(KERNELOBJ) $(KERNELLD)
	$(LD) $(LDFLAGS) -T $(KERNELLD) -o $@ $(KERNELOBJ)

run: $(KERNELBIN)
	$(QEMU) $(QEMUFLAGS) -kernel $^

gdb: $(KERNELBIN)
	@echo "**********Start riscv64-unknown-linux-gnu-gdb on another window"
	@echo "**********Target remote localhost:26000"
	$(QEMU) $(QEMUFLAGS) -kernel $(KERNELBIN) $(QEMUGDBFLAGS) 
clean:
	rm -f $(KERNELOBJ) $(USEROBJ) $(KERNELOBJ:%.o=%.d) $(USEROBJ:%.o:%.d)
.PHONY: clean run gdb
