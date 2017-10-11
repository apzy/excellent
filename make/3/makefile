hello:hello.o name.o

%.o:%.c
	gcc -c $< -o $@

include name.mk

.PHONY:clean
$(CL):
	-rm $(FILE)
