SECTION .data
SECTION .text
global _start

_start:
  nop
  mov eax, 0ffffffffh
  mov ebx, 03b72h
  mul ebx, 1
  nop
  section .bss
