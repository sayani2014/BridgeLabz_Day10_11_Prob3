#! /bin/bash -x

declare -A singlet
countHead=0
countTail=0

read -p "Enter the number of times you want to flip the coin: " number

for((i=1;i<=number;i++))
do
	flipCoin1=$((RANDOM%2))

	#Singlet combo
	if(($flipCoin1==1))
	then
		countHead=$(($countHead+1))
		singlet[$i]="H"
	else
		countTail=$(($countTail+1))
		singlet[$i]="T"
	fi
done

echo "Singlet dictionary: " "${singlet[@]}"

percentageHead=$(($countHead * 100 / $number))
echo -n "Percentage of HEAD in the singlet dictionary is: " 
echo "scale=2;$percentageHead" | bc

percentageTail=$(($countTail * 100 / $number))
echo -n "Percentage of TAIL in the singlet dictionary is: " 
echo "scale=2;$percentageTail" | bc
		