TARGETS = exercise502 exercise503 exercise504 exercise505 exercise507
ASMFLAGS = -g -O0

all: $(TARGETS)

exercise502:	exercise502.S memcpy.S
	gcc -o $@ $(ASMFLAGS) memcpy.S $@.S

exercise503:	exercise503.S abs.S
	gcc -o $@ $(ASMFLAGS) abs.S $@.S

exercise504:	exercise504.S
	gcc -o $@ $(ASMFLAGS) $@.S

exercise505:	exercise505.S
	gcc -o $@ $(ASMFLAGS) $@.S

exercise506:	exercise506.S
	gcc -o $@ $(ASMFLAGS) $@.S

exercise507:	exercise507.S
	gcc -o $@ $(ASMFLAGS) $@.S

run: $(TARGETS)
	@for target in $(TARGETS);		\
	do					\
		echo "Running $$target";	\
		./$$target;			\
	done

clean:
	rm -f *.o *.core $(TARGETS)
