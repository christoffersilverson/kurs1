#!/bin/bash

input="0"
first=true
while [[ ! "$input" == "red" ]]; do #loop until answer is correct

	echo -n "Enter your favorite color: "
	read -e input
	if [[ "$input" == "red" ]]; then #exit on correct answer
		echo "correct!"
		exit
	fi
	echo " "
	echo "WRONG COLOR, TRY AGAIN IN 3 SECONDS"
	sleep 3s #sleep 3 seconds
	clear
done
