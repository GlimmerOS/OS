# Workspace
WORKDIR = $(abspath .)
BUILDDIR = $(WORKDIR)/build

$(shell mkdir -p $(BUILDDIR))

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

run:
	$(QEMU) $(QEMUFLAGS)

gdb:
	@echo "**********Start riscv64-unknown-linux-gnu-gdb on another window"
	@echo "**********Target remote localhost:26000"
	$(QEMU) $(QEMUFLAGS) $(QEMUGDBFLAGS) 

clean:
	rm -rf $(BUILDDIR);

.PHONY: clean run
