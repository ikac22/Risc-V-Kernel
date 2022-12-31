OUTPUT_ARCH( "riscv" )
ENTRY( _entry )

SECTIONS
{
  /*
   * ensure that entry.S / _entry is at 0x80000000,
   * where qemu's -kernel jumps.
   */
  . = 0x80000000;

  .text : {
    PROVIDE(_kernel_text_start = .);
    *(.entry_os) 
    
    . = ALIGN(0x1000);
    EXCLUDE_FILE (build/src/*) *(.text .text.*)

    . = ALIGN(0x1000);
    build/src/kernel/*(.text .text.*)
    PROVIDE(_kernel_text_end = .);

    . = ALIGN(0x1000);
    PROVIDE(_user_text_start = .);
    EXCLUDE_FILE (build/src/kernel/*) build/src/user/*(.text .text*)
    PROVIDE(_user_text_end = .);
    
    . = ALIGN(0x1000);
    PROVIDE(etext = .);
  }

  .rodata : {
    . = ALIGN(16);
    *(.srodata .srodata.*) /* do not need to distinguish this from .rodata */
    . = ALIGN(16);
    *(.rodata .rodata.*)
  }

  .data : {
    . = ALIGN(16);
    *(.sdata .sdata.*) /* do not need to distinguish this from .data */
    . = ALIGN(16);
    *(.data .data.*)
  }

  .bss : {
    . = ALIGN(16);
    *(.sbss .sbss.*) /* do not need to distinguish this from .bss */
    . = ALIGN(16);
    *(.bss .bss.*)
  }

  PROVIDE(end = .);
}
