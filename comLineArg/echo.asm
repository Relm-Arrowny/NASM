; Executable name : echo
; Version         : 1.0
; Created date    : 25/09/2022
; Last update     : 25/09/2022
; Aurthor         : Relm
; Description     : reading command line parameters
; Build commands:
;           echo: echo.o
;	              gcc -o echo echo.o
;           echo.o: echo.asm
;	              nasm -f elf64  -g echo.asm


  global main
  extern puts
SECTION .data
SECTION .bss
SECTION .text

main:
      push rbp            ;must preserve rbp, rbx, rsi rdi
      mov  rbp, rsp       ;stack pointer position is no the base pointer for this SECTION
      push rbx
      push rsi
      push rdi
      ;;; boilerplate
      
      mov rdi, [rsi]      ;move first parameters
      call puts           ;print it

      pop rdi             ;restore the stack
      pop rsi
      pop rbx
      pop rbp

      add rsi,8           ;move to next
      dec rdi              ;move to next varargs
      jnz main              ; do it again if there are still avar

      ret
