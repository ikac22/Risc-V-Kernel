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
    PROVIDE(_user_rodata_start = .);
    *(.srodata .srodata.*) /* do not need to distinguish this from .rodata */
    . = ALIGN(16);
    *(.rodata .rodata.*)
    PROVIDE(_user_rodata_end = .);
   
    . = ALIGN(0x1000);
  }

  .data : {
    . = ALIGN(16);
    EXCLUDE_FILE (build/src/user/*) *(.sdata .sdata.*) /* do not need to distinguish this from .data */
    . = ALIGN(16);
    EXCLUDE_FILE (build/src/user/*) *(.data .data.*)

    . = ALIGN(0x1000);
    PROVIDE(_user_data_start = .);
    build/src/user/*(.sdata .sdata.*)
    . = ALIGN(16);
    build/src/user/*(.data .data.*)
    PROVIDE(_user_data_end = .);

    . = ALIGN(0x1000);
  }

  .bss : {
    . = ALIGN(16);
    EXCLUDE_FILE (build/src/user/*) *(.sbss .sbss.*) /* do not need to distinguish this from .bss */
    . = ALIGN(16);
    EXCLUDE_FILE (build/sr/user/*) *(.bss .bss.*)

    
    . = ALIGN(0x1000);
    PROVIDE(_user_bss_start = .);
    build/src/user/*(.sbss .sbss.*)
    . = ALIGN(16);
    build/src/user/*(.bss .bss.*)
    PROVIDE(_user_bss_end = .);
    
  }

  PROVIDE(end = .);
}
