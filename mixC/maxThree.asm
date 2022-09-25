; Executable name : maxThree
; Version         : 1.0
; Created date    : 25/09/2022
; Last update     : 25/09/2022
; Aurthor         : Relm
; Description     : Mixing c with assembly, finding the mix of 3 number.
; Build commands:
;           maxThree: maxThree.o, callMaxThree.c
;	              gcc callMaxThree.c -o maxThree maxThree.o
;           maxThree.o: maxThree.asm
;	              nasm felf64  -g maxThree.asm


global maxThree

SECTION .data

SECTION .text

maxThree:
          mov rax, rdi   ; move the first val to reture regester
          cmp rax, rsi   ; compare the first and 2nd number
          cmovl rax, rsi ; move new value to ras if rsi> rax
          cmp rax, rdx   ; compare again with last number
          cmovl rax, rdx ; again move if rax is smaller
          ret            ; retrin (not rax is default int return)
