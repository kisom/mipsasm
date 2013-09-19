TARGETS = hello exercise24

all: $(TARGETS)

.if TARGET==spim
hello: hello32.S
	@spim -quiet -file hello32.S

exercise24: exercise24_32.S
	@spim -quiet -file exercise24_32.S
.else
hello: hello64.S
	gcc -o $@ hello64.S

exercise24: exercise24_64.S
	gcc -g -o $@ exercise24_64.S
.endif

clean:
	rm -f $(TARGETS) *.core

.PHONY: all clean
