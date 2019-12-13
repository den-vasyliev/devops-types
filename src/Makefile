# The lamest makefile ever

httpd:
	nasm -O0 -o ./httpd.o httpd.asm
	ld httpd.o -o httpd

clean:
	rm -rf httpd.o httpd
