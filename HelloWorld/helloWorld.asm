; Executable name : helloWorld
; Version         : 1.0
; Created date    : 08/09/2022
; Last update     : 08/09/2022
; Aurthor         : Relm
; Description       : A hello world to test nsam 64
; Build commands:
;           helloWorld: helloWorld.o
;	              ld -o helloWorld helloWorld.o
;           helloWorld.o: helloWorld.asm
;	              nasm felf64 helloWorld.asm

SECTION .data      ;Data setction

HelloWorld:     db "Hello world", 10
HelloWorldLen:  equ $-HelloWorld

SECTION .bss       ;  uninitialized Data

SECTION  .text     ;  Code

global _start       ; Linker entry point

_start:
      mov   rax, 1              ;Write call
      mov   rdi, 1              ; STD
      mov   rsi, HelloWorld     ;address of message
      mov   rdx, HelloWorldLen  ; bytes of the message
      syscall                   ; call god
      mov   rax, 60             ; exit
      xor   rdi, rdi            ;exit code 0
      syscall                   ; Call god
