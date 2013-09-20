TMP_FILES = tmp.out
TARGETS = owrite oread

all: syscheck $(TARGETS)

syscheck:
	@echo -n "Checking system is OpenBSD.mips64..."
	@./syscheck.sh
	@echo "ok"

owrite: owrite.S
	$(CC) -o $@ $?

oread: oread.S
	$(CC) -o $@ $?

test: $(TARGETS)
	./test.sh

clean:
	rm -f $(TMP_FILES) $(TARGETS)

.PHONY: all clean syscheck test
