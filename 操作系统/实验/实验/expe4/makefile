hdrs = ipc.h
opts = -g -c
p_src = producer.c ipc.c
p_obj = producer.o ipc.o
a_src = smoker1.c ipc.c
a_obj = smoker1.o ipc.o
b_src = smoker2.c ipc.c
b_obj = smoker2.o ipc.o
c_src = smoker3.c ipc.c
c_obj = smoker3.c ipc.o
all:	smoker1	smoker2	smoker3 producer
smoker1:		$(a_obj)
	gcc $(a_obj) -o smoker1
smoker1.o: 	$(a_src) $(hdrs)
	gcc $(opts) $(a_src) -lrt
smoker2:		$(b_obj)
	gcc $(b_obj) -o smoker2
smoker2.o: 	$(b_src) $(hdrs)
	gcc $(opts) $(b_src) -lrt
smoker3:		$(c_obj)
	gcc $(c_obj) -o smoker3
smoker3.o: 	$(c_src) $(hdrs)
	gcc $(opts) $(c_src) -lrt
producer: 	$(p_obj)
	gcc $(p_obj) -o producer
producer.o: 	$(p_src) $(hdrs)
	gcc $(opts) $(p_src) -lrt
clean:
	rm smoker1 smoker2 smoker3 producer *.o 

