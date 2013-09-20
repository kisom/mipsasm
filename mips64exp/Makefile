TMP_FILES = tmp.out
TARGETS = owrite

all: syscheck owrite

syscheck:
	@echo -n "Checking system is OpenBSD.mips64..."
	@./syscheck.sh
	@echo "ok"

owrite: owrite.S
	$(CC) -o $@ $?

clean:
	rm -f $(TMP_FILES) $(TARGETS)

.PHONY: all clean syscheck
