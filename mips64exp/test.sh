#!/bin/ksh

echo -n "Testing owrite..."
./owrite
if [ $? -ne 0 ]; then
	echo "failed!"
	exit 1
elif [ ! -f tmp.out ]; then
	echo "failed!"
	exit 2
elif [ ! -s tmp.out ]; then
	echo "failed!"
	exit 3
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

echo -n "Testing linktmp..."
./linktmp
if [ $? -ne 0 ]; then
	echo "failed."
	exit 1
elif [ ! -e "tmp_link.out" ]; then
	echo "failed."
	exit 2
else
	echo "ok"
fi

echo -n "Testing unlinktmp..."
./unlinktmp
if [ $? -ne 0 ]; then
	echo "failed!"
	exit 1
elif [ -f tmp_link.out ]; then
	echo "failed!"
	exit 2
elif [ -f tmp.out ]; then
	echo "failed!"
	exit 3
else
	echo "ok"
fi


