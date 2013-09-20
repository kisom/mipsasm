#!/bin/sh

if [ "$(uname -s)" != "OpenBSD" ]; then
	echo
	echo "[!] This code is targeted to OpenBSD, and you are not on"
	echo "    an OpenBSD system. *This code will probably not work!*"
	exit 1
elif [ "$(arch -s)" != "mips64" ]; then
	echo
	echo "[!] This code is written in MIPS64 assembly, and you are"
	echo "    not on a MIPS64 machine. This code will not work."
	exit 1
fi
