vpath %.h common
vpath %.c sub1
vpath %.c sub2

include hello.mk

hello:main.o info.o 
	$(CC) -o $@ main.o info.o

%.o:%.c
	$(CC) -I common -c $< -o $@ 
	
.PHONY:clear
$(CL):
	rm -f $(FILE)
