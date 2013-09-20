#!/bin/ksh

echo -n "Testing owrite..."
./owrite
if [ $? -ne 0 ]; then
	echo "failed!"
	exit 1
else
	echo "ok"
fi

echo -n "Testing oread..."
./oread > /dev/null		# oread will print to console
if [ $? -ne 0 ]; then
	echo "failed."
	exit 1
else
	echo "ok"
fi

