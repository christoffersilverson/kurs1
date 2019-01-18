#!/bin/bash
if [ -e "$1" ]; then
	while read -r line; do
	printf "$line \n" #print the line
	printf "\n" #print a space
	printf "\n" #print another space, this can be removed.
	done < "$1"
else
	echo "error: file does not exist."
	exit
fi
