src = pipe.c
obj = pipe.o
opt = -g -c

all:	pipe
pipe: $(obj)
	gcc $(obj) -l pthread -o pipe
pipe.o:$(src)
	gcc $(opt) $(src) 
clean:
	rm pipe *.o           