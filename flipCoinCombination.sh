#!/bin/bash

declare -A coin
	echo "${coin[@]}"

read -p "Enter number of coin flips: " iter

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
