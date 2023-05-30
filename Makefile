# Workspace
WORKDIR = $(abspath .)
BUILDDIR = $(WORKDIR)/build

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
AS = $(TOOLPREFIX)gcc
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
DRIVE = file=$(IMG),if=none,format=raw,id=x0
DEVICE = virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0

QEMUFLAGS = -machine $(MACHINE) \
						-bios $(BIOS) \
						-m $(MEMORYSIZE) \
						-nographic \
						-drive $(DRIVE) \
						-device $(DEVICE) \
						-global virtio-mmio.force-legacy=false

# C compile options
CFLAGS = -Wall -Werror -ggdb3 \
				 -MD \
				 -ffreestanding -fno-common -nostdlib -mno-relax -mcmodel=medany
INCLUDEPATH = $(WORKDIR)/include
INCLUDEFLAG =  $(addprefix -I, $(INCLUDEPATH))
CFLAGS += $(INCLUDEFLAG)
ASFLAGS += -MD $(INCLUDEFLAG)

# kernel info
KERNELSRC = $(shell find $(K) -name "*.c")
KERNELASM = $(shell find $(K) -name "*.S")
KERNELOBJ = $(subst $(WORKDIR), $(BUILDDIR), $(KERNELSRC:%.c=%.o))
KERNELOBJ += $(subst $(WORKDIR), $(BUILDDIR), $(KERNELASM:%.S=%.o))
-include $(subst $(WORKDIR), $(BUILDDIR), $(KERNELSRC:%.c:%.d))

KERNELBIN = $(BUILDDIR)/kernel.bin
KERNELLD = $(K)/kernel.ld

# user info
USERSRC = $(shell find $(U) -name "*.c")
USEROBJ = $(subst $(WORKDIR), $(BUILDDIR), $(USERSRC:%.c=%.o))
-include $(subst $(WORKDIR), $(BUILDDIR), $(USERSRC:%.c:%.d))

# compile rules
$(BUILDDIR)/%.o: $(WORKDIR)/%.c
	@mkdir -p $(dir $@) && echo + CC $<
	@$(CC) $(CFLAGS) -c -o $@ $<

$(BUILDDIR)/%.o: $(WORKDIR)/%.S
	@mkdir -p $(dir $@) && echo + AS $<
	@$(AS) $(ASFLAGS) -c -o $@ $<

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
	@echo "**********Start riscv64-unknown-linux-gnu-gdb on another window********************"
	@$(QEMU) $(QEMUFLAGS) -kernel $(KERNELBIN) $(QEMUGDBFLAGS) 

IMG = $(WORKDIR)/fat32.img

# make fat32 image
img:
	dd if=/dev/zero of=$(IMG) bs=1M count=128
	mkfs.fat -F 32 $(IMG)

docs: clean
	./docs.sh

# clean project not needed files
clean:
	rm -rf $(BUILDDIR)

.PHONY: clean run gdb docs img
