OUTPUT_ARCH(riscv)
ENTRY(_entry )
BASE_ADDRESS = 0x80200000;

SECTIONS
{
  . = BASE_ADDRESS;
  .text : {
    *(.text .text.*)
    . = ALIGN(0x1000);
  }

  .rodata : {
    *(.srodata .srodata.*)
    *(.rodata .rodata.*)
  }

  . = ALIGN(4K);
  .data : {
    *(.data .data.*)
    *(.sdata .sdata.*)
  }

  . = ALIGN(4K);
  .bss : {
    *(.bss.stack)
    *(.bss .bss.*)
    *(.sbss .sbss.*)
  }

  /DISCARD/ : {
        *(.eh_frame)
  }
}
