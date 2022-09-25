maxThree: callMaxThree.c maxThree.o
	gcc callMaxThree.c maxThree.o -o maxThree 
maxThree.o: maxThree.asm
	nasm -f elf64  -g maxThree.asm
