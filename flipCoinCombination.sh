#! /bin/bash -x

declare -A singlet
declare -A doublet

countHead=0
countTail=0
countHH=0
countHT=0
countTH=0
countTT=0

singletFunc () {
	for((i=1;i<=number;i++))
	do
		flipCoin=$((RANDOM%2))
		if(($flipCoin==1))
		then
			countHead=$(($countHead+1))
			headFlip=$flipCoin
			singlet[$i]="H"
		else
			countTail=$(($countTail+1))
			tailFlip=$flipCoin
			singlet[$i]="T"
		fi
	done

	echo -n "Singlet dictionary: " 
	for i in ${singlet[@]}; do echo $i; done
	
	headCountPercent=`percentageCalculator $countHead`
	tailCountPercent=`percentageCalculator $countTail`
	echo "The percentage of HEAD in singlet dictionary is: " "$headCountPercent" "%"
	echo "The percentage of TAIL in singlet dictionary is : $tailCountPercent %"

	
}

doubletFunc () {
        count=1
	length=$((${#singlet[@]}**2))
	echo "$length"
	for((i=1;i<=${#singlet[@]};i++))
	do
		for((j=1;j<=${#singlet[@]};j++))
		do
			while [ $count -le $length ]
                        do
 			     doublet[$count]=${singlet[$i]}${singlet[$j]}
                             let "count += 1"
                             break
                        done		
		done	
	done
	echo -n "Doublet dictionary: "
	for i in ${doublet[@]}; do echo $i; done | sort -u
	
	for((i=1;i<=${#singlet[@]};i++))
	do
		if((${singlet[$i]}==HH))
		then
			countHH=$((countHH+1))
		elif((${singlet[$i]}==HT))
		then
			countHT=$((countHT+1))
		elif((${singlet[$i]}==TH))
		then
			countTH=$((countTH+1))
		elif((${singlet[$i]}==TT))
		then
			countTT=$((countTT+1))
		fi
	done
	HHCountPercent=`percentageCalculator $countHH`
	HTCountPercent=`percentageCalculator $countHT`
	THCountPercent=`percentageCalculator $countTH`
	TTCountPercent=`percentageCalculator $countTT`
	echo "The percentage of HH in doublet dictionary is: $HHCountPercent%"
	echo "The percentage of HT in doublet dictionary is : $HTCountPercent%"
	echo "The percentage of TH in doublet dictionary is : $THCountPercent%"
	echo "The percentage of TT in doublet dictionary is : $TTCountPercent%"

}

percentageCalculator () {
	percent=`echo "scale=2;($1*100)/$number" | bc`
	echo $percent
}

read -p "Enter the number of times you want to flip the coin: " number

singletFunc
doubletFunc

		
