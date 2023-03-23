OUTPUT_ARCH( riscv )
ENTRY( _entry )
BASE_ADDRESS = 0x80200000;

SECTIONS
{
  . = BASE_ADDRESS;
  .text : {
    *(.text .text.*)
    . = ALIGN(0x1000);
  }

  .rodata : {
    . = ALIGN(16);
    *(.srodata .srodata.*)
    . = ALIGN(16);
    *(.rodata .rodata.*)
  }

  .data : {
    . = ALIGN(16);
    *(.sdata .sdata.*)
    . = ALIGN(16);
    *(.data .data.*)
  }

  .bss : {
    . = ALIGN(16);
    *(.sbss .sbss.*)
    . = ALIGN(16);
    *(.bss .bss.*)
  }

}
