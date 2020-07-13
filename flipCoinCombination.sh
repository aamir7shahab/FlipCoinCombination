#!/bin/bash

declare -A coin
	echo "${coin[@]}"

read -p "Enter number of coin flips: " iter

echo "-----------Singlet Combination-----------"
temp=$iter
heads='H'
tails='T'
headCount=0
tailCount=0
coin['Singlet']=''
while [[ $temp -gt 0 ]]; do
	toss=$((RANDOM%2))
	if [[ $toss -eq 0 ]]; then
		coin['Singlet']+='H'
		headCount=$((headCount+1))
	else 
		coin['Singlet']+='T'
		tailCount=$((tailCount+1))
	fi
	((temp--))
done

echo "Singlet Toss: ${coin[@]}"
echo "Head count: $headCount"
echo "Tail count: $tailCount"
headPer=`echo "scale=2;x=$headCount*100/$iter;x" | bc`
echo "Head % : $headPer%"
tailPer=`echo "scale=2;x=$tailCount*100/$iter;x" | bc`
echo "Tail % : $tailPer%"

# Doublet Combiation
echo "-----------Doublet Combination-----------"
HH=0
TT=0
HT=0
TH=0
if [[ $iter%2 -eq 0 ]]; then
	for (( i = 0; i <= $iter-2; i=i+2 )); do
		j=$i
		comb=${coin[Singlet]:$j:2}
		if [[ $comb -eq 'HH' ]]; then
			HH=$((HH+1))
		elif [[ $comb -eq 'HT' ]]; then
			HT=$((HT+1))
		elif [[ $comb -eq 'TH' ]]; then
			TH=$((TH+1))
		else
			TT=$((TT+1))
		fi
	done
	echo "HH count: $HH"
	echo "TT count: $TT"
	echo "HT count: $HT"
	echo "TH count: $TH"
	hhPer=`echo "scale=2;x=$HH*200/$iter;x" | bc`
	echo "HH % : $hhPer%"
	ttPer=`echo "scale=2;x=$TT*200/$iter;x" | bc`
	echo "TT % : $ttPer%"
	htPer=`echo "scale=2;x=$HT*200/$iter;x" | bc`
	echo "HT % : $htPer%"
	thPer=`echo "scale=2;x=$TH*200/$iter;x" | bc`
	echo "TH % : $thPer%"
else
	echo "Doublet not possible, Enter coin flip is not divisible by 2."
fi