# Kill process (QEMU) on gdb exits
define hook-quit
  kill
end

# connect remote
target remote localhost:26000
file kernel/kernel
break *0x80200000
continue
layout asm
