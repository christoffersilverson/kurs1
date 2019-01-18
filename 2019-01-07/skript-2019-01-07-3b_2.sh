#!/bin/bash
if [ -e "$1" ]; then
        while read -r line; do
       		if [ ! -z "$line" ]; then #if line is not empty
			printf "$line \n" #print it
		fi
        done < "$1"
else
        echo "error: file does not exist."
        exit
fi
exit
