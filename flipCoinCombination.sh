#! /bin/bash -x

flipCoin=$((RANDOM%2))
if(($flipCoin==1))
then
	echo "HEAD"
else
	echo "TAIL"
fi		