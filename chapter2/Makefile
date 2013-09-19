all: hello32 hello64

hello32: hello32.S
	gcc -o $@ -mips32r2 hello32.S

hello64: hello64.S
	gcc -o $@ hello64.S

clean:
	rm -f hello32 hello64

.PHONY: all clean
