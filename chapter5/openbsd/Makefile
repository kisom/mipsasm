TARGETS = exercise502
ASMFLAGS = -g -O0

all: $(TARGETS)

exercise502:	exercise502.S memcpy.S
	gcc -o $@ $(ASMFLAGS) memcpy.S $@.S

clean:
	rm -f *.o *.core $(TARGETS)
