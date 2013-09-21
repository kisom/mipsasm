TMP_FILES = tmp.out tmp_link.out
ASMFLAGS = -g -O0
TARGETS = owrite	\
	  oread		\
	  linktmp	\
	  unlinktmp	\
	  daemon	\
	  util_test

all: syscheck $(TARGETS)

syscheck:
	@echo -n "Checking system is OpenBSD.mips64..."
	@./syscheck.sh
	@echo "ok"

owrite: owrite.S
	$(CC) $(ASMFLAGS) -o $@ $?

oread: oread.S
	$(CC) $(ASMFLAGS) -o $@ $?

linktmp: linktmp.S
	$(CC) $(ASMFLAGS) -o $@ $?

unlinktmp: unlinktmp.S
	$(CC) $(ASMFLAGS) -o $@ $?

daemon: daemon.S
	$(CC) $(ASMFLAGS) -o $@ $?

util_test: util.S util_test.S
	$(CC) $(ASMFLAGS) -o $@ util.S util_test.S

test: syscheck $(TARGETS)
	./test.sh

clean:
	rm -f $(TMP_FILES) $(TARGETS) *.core *.o

.PHONY: all clean syscheck test
