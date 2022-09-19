;Executable name :fibonacci
; Description     : print out fibonacci number up to a give limit
; Build commands:
;                drawStar: drawStar.o
;         	             ld -o fibonacci fibonacci.o
;                drawStar.o: drawStar.asm
;         	             nasm -felf64 -g fibonacci.asm

SECTION .data         ;data section.

MAXFIBNUM equ 88      ; number of fibonacci to be printf
FORMAT: db "%ld   %d", 10, 0 ; define the output formate

SECTION .bss                    ;uninitialized Data

SECTION .text                   ;Code

extern printf                   ; get c printf routin
global main                     ;needed for c linker


main:
        push rbp            ;must preserve rbp, rbx, rsi rdi
        mov  rbp, rsp       ;stack pointer position is no the base pointer for this SECTION
        push rbx
        push rsi
        push rdi
        ;;; boilerplate
        mov r10, 1           ; r8 to store zero number
        mov r11, 0       ; r9 will be first number
        mov r12, MAXFIBNUM    ;set the max number
print_fib:

      mov rdi, FORMAT        ;set output format
      mov rsi, r11           ;move number for print out
      mov rdx, r12
      push r11              ;save the numbers on the stack
      push r11
      push r10


      xor rax, rax           ; varargs
      call printf            ; call the printf function
      pop r10                ;restore the counters
      pop r11
      add r11, r10           ;sum the two number for the next fib number
      pop r10               ;set the zero(last) number
      dec r12
      jnz print_fib          ; if max number not reach jump back to print_fib

;; restore the stack
      pop rdi
      pop rsi
      pop rbx
      mov rsp, rbp
      pop rbp
      ret
