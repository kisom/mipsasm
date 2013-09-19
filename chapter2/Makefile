sgi: hello64

spim: hello32

hello32: hello32.S
	 @spim -quiet -file hello32.S

hello64: hello64.S
	gcc -o $@ hello64.S

clean:
	rm -f hello32 hello64

.PHONY: all clean
