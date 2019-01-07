#!/bin/bash
if [ -e "$1" ]; then
	while read -r line; do
	printf "$line \n"
	printf "\n"
	printf "\n"
	done < "$1"
else
	echo "error: file does not exist."
	exit
fi
