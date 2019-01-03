#!/bin/bash
SEARCH_DIRECTORY=/usr/share/* # because magic strings are bad practice
SEARCH_SIZE="1M"


# Alternate way to map results into array, less robust

#arr=( $(find $SEARCH_DIRECTORY -size +1M) )


# map list of files with size above 1M to array

mapfile -t arr < <(find $SEARCH_DIRECTORY -size +$SEARCH_SIZE)
array_length=${#arr[@]}
#echo $array_length
if [ $array_length -ge 10000 ]; then
	warn=10000
elif [ $array_length -ge 1000 ]; then
	warn=1000
elif [ $array_length -ge 100 ]; then
	warn=100
elif [ $array_length -ge 10 ]; then
	warn=10
else
	warn=0
	exit
fi

userinput="lol1337placeholder"

echo "WARNING: OVER $warn FILES DETECTED!"

while [[ ! "$userinput" = "y" && ! "$userinput" = "n" ]]; do
	echo -n "DO YOU WISH TO COMPRESS FILES TO ARCHIVE? [Y/N] "
	read -n1 userinput
	printf "\n"
done
if [ "$userinput" = "n" ]; do
	exit
fi

