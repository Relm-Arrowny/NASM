; Executable name : drawStar
; Version         : 1.0
; Created date    : 14/09/2022
; Last update     : 14/09/2022
; Aurthor         : Relm
; Description     : looping and drawing star on screen nsam 64
; Build commands:
;           drawStar: drawStar.o
;	              ld -o drawStar drawStar.o
;           drawStar.o: drawStar.asm
;	              nasm felf64 drawStar.asm

SECTION .Data                   ;Data setction

MAXLINE equ 8                   ;Max number of line
DATASIZE equ 44                 ;(8+1)*4 number of star plus 1 byte for newline

SECTION .bss                    ;uninitialized Data

output: resb DATASIZE           ; resb for data output

SECTIOn .text                   ;Code

global _start                   ;Linker entry point

_start:
    ;setup the regesters for counting
    mov r8, 1                    ;line start with line 1
    mov r9, 0                    ;line will be done 1 time

    mov rcx, output              ; address of the line output
line:
      mov byte [rcx], "*"                ;draw one start
      inc rcx                    ;Move long output by 1 byte
      inc r9                     ; inc number of star per line
      cmp r8, r9
      jnz line
newline:
      mov byte [rcx], 10               ;add end of line
      inc rcx                    ;Move long output by 1 byte
      inc r8                    ; increase line counter
      mov r9, 0                 ; reset star needed to be drawn
      cmp r8,MAXLINE            ; check if max line is reached
      jle line
print:
      mov rax, 1                ; write Call
      mov rdi, 1                ; stdout
      mov rsi, output           ; address of out line buffer
      mov rdx, DATASIZE         ;bytes of the buffer
      syscall                    ;ask god
      mov rax, 60
      xor rdi,rdi                ;clear rdi
      syscall
