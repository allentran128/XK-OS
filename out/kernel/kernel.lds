




OUTPUT_ARCH(i386:x86-64)
SECTIONS
{
 . = ((0x00100000) + 0xFFFFFFFF80000000);
 .text : {
  _start = .;
  *(.head.text)
  *(.text .text.*)
  _etext = .;
 }
 .rodata : {
  *(.rodata .rodata.*)
 }
 . = ALIGN(0x1000);
 PROVIDE(data = .);
 .data : {
  *(.data .data.*)
  _edata = .;
 }
 .bss : {
  *(.bss .bss.*)
 }
 . = ALIGN(0x1000);
 PROVIDE(_end = .);
}
