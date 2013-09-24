TARGETS = exercise502 exercise503
ASMFLAGS = -g -O0

all: $(TARGETS)

exercise502:	exercise502.S memcpy.S
	gcc -o $@ $(ASMFLAGS) memcpy.S $@.S

exercise503:	exercise503.S abs.S
	gcc -o $@ $(ASMFLAGS) abs.S $@.S

clean:
	rm -f *.o *.core $(TARGETS)
