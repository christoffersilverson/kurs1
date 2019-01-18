#!/bin/bash
echo -n "ENTER FILE TO CHECK "
read -e filename

if  [[ ! -e $filename ]]; then #check if file exists
	echo "FILE NOT FOUND"
	exit
fi
if [[ ! -x "$filename" ]]; then #check if file is +x
	echo "FILE IS NOT EXECUTABLE. CHMODDING FILE"
	chmod +x "$filename"
fi
exit
