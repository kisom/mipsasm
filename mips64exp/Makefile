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

.SUFFIXES: .S .o
.S.o:
	${CC} ${ASMFLAGS} -c $<

owrite: owrite.o
	$(CC) $(ASMFLAGS) -o $@ $?

oread: oread.o
	$(CC) $(ASMFLAGS) -o $@ $?

linktmp: linktmp.o
	$(CC) $(ASMFLAGS) -o $@ $?

unlinktmp: unlinktmp.o
	$(CC) $(ASMFLAGS) -o $@ $?

daemon: daemon.o
	$(CC) $(ASMFLAGS) -o $@ $?

util_test: ../lib/util.S util_test.S
	$(CC) $(ASMFLAGS) -o $@ ../lib/util.S util_test.S

test: syscheck $(TARGETS)
	./test.sh

clean:
	rm -f $(TMP_FILES) $(TARGETS) *.core *.o

.PHONY: all clean syscheck test
