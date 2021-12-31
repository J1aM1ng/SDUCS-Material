header = ipc.h
b_src = barber.c ipc.c
b_obj = barber.o ipc.o
c_src = customer.c ipc.c
c_obj = customer.o ipc.o
opts = -g -c
all: barber customer
barber: $(b_obj)
	gcc $(b_obj) -o barber
barber.o: $(b_src) $(header)
	gcc $(opts) $(b_src)
customer: $(c_obj)
	gcc $(c_obj) -o customer
customer.o: $(c_src) $(header)
	gcc $(opts) $(c_src) 
clean:
	rm barber customer *.o
