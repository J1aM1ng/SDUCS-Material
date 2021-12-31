SRC = $(wildcard src/*.c)
INPUT ?= $(wildcard inputs/*/*.x)
RM = rm -rf
RUN = run

ifeq ($(OS), Windows_NT)
	_OS = NT
	RM = del
else
	_OS = Linux
endif


.PHONY: all verify clean

all: sim

sim: $(SRC)
	gcc -g -O2 $^ -o $@

run: clean sim
	@./$(RUN) $(INPUT)

clean:
	-$(RM) *.o sim sim.exe
