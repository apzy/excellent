vpath %.h common
vpath %.c sub1
vpath %.c sub2

include hello.mk

hello:main.o info.o
	gcc -o hello sub1/main.o sub2/info.o

main.o:
	cd sub1 && $(MAKE)

info.o:
	cd sub2 && $(MAKE)

clear:
	rm -f hello sub1/main.o sub2/info.o
