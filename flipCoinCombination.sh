#! /bin/bash -x

declare -A singlet
declare -A doublet
declare -A triplet

countHead=0
countTail=0
countHH=0
countHT=0
countTH=0
countTT=0
countHHH=0
countHHT=0
countHTH=0
countHTT=0
countTHH=0
countTHT=0
countTTH=0
countTTT=0

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
	#echo "$length"
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
	
	for((i=1;i<=${#doublet[@]};i++))
	do
		if((${doublet[$i]}==HH))
		then
			countHH=$((countHH+1))
		elif((${doublet[$i]}==HT))
		then
			countHT=$((countHT+1))
		elif((${doublet[$i]}==TH))
		then
			countTH=$((countTH+1))
		elif((${doublet[$i]}==TT))
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

tripletFunc () {
        count=1
	length=$((${#singlet[@]}**2))
	#echo "$length"
	for((i=1;i<=${#singlet[@]};i++))
	do
		for((j=1;j<=${#singlet[@]};j++))
		do
			for((k=1;k<=${#singlet[@]};k++))
			do
				while [ $count -le $length ]
                        	do
 			     		triplet[$count]=${singlet[$i]}${singlet[$j]}${singlet[$k]}
                             		let "count += 1"
                             		break
                        	done	
			done
		done	
	done
	echo -n "Triplet dictionary: "
	for i in ${triplet[@]}; do echo $i; done | sort -u
	
	for((i=1;i<=${#triplet[@]};i++))
	do
		if((${triplet[$i]}==HHH))
		then
			countHHH=$((countHHH+1))
		elif((${triplet[$i]}==HHT))
		then
			countHHT=$((countHHT+1))
		elif((${triplet[$i]}==HTH))
		then
			countHTH=$((countHTH+1))
		elif((${triplet[$i]}==HTT))
		then
			countHTT=$((countHTT+1))
		elif((${triplet[$i]}==THH))
		then
			countTHH=$((countTHH+1))
		elif((${triplet[$i]}==THT))
		then
			countTHT=$((countTHT+1))
		elif((${triplet[$i]}==TTH))
		then
			countTTH=$((countTTH+1))
		elif((${triplet[$i]}==TTT))
		then
			countTTT=$((countTTT+1))
		fi
	done
	HHHCountPercent=`percentageCalculator $countHHH`
	HHTCountPercent=`percentageCalculator $countHHT`
	HTHCountPercent=`percentageCalculator $countHTH`
	HTTCountPercent=`percentageCalculator $countHTT`
	THHCountPercent=`percentageCalculator $countTHH`
	THTCountPercent=`percentageCalculator $countTHT`
	TTHCountPercent=`percentageCalculator $countTTH`
	TTTCountPercent=`percentageCalculator $countTTT`
	echo "The percentage of HHH in doublet dictionary is: $HHHCountPercent%"
	echo "The percentage of HHT in doublet dictionary is : $HHTCountPercent%"
	echo "The percentage of HTH in doublet dictionary is : $HTHCountPercent%"
	echo "The percentage of HTT in doublet dictionary is : $HTTCountPercent%"
	echo "The percentage of THH in doublet dictionary is : $THHCountPercent%"
	echo "The percentage of THT in doublet dictionary is : $THTCountPercent%"
	echo "The percentage of TTH in doublet dictionary is : $TTHCountPercent%"
	echo "The percentage of TTT in doublet dictionary is : $TTTCountPercent%"
}

percentageCalculator () {
	percent=`echo "scale=2;($1*100)/$number" | bc`
	echo $percent
}

read -p "Enter the number of times you want to flip the coin: " number

singletFunc
doubletFunc
tripletFunc
		
