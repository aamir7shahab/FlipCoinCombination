#!/bin/bash

declare -A coin
	echo "${coin[@]}"

toss=$((RANDOM%2))

if [[ $toss -eq 0 ]]; then
	echo "It is Heads."
else 
	echo "It is Tails."
fi
