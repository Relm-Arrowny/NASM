echo:echo.o
	gcc -o echo -no-pie echo.o
echo.o: echo.asm
	nasm -f elf64  -g echo.asm
