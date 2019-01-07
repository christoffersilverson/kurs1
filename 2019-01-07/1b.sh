#!/bin/bash
echo -n "ENTER FILE TO CHECK "
read -e filename

if  [[ ! -e $filename ]]; then
	echo "FILE NOT FOUND"
	exit
fi
if [[ ! -x "$filename" ]]; then
	echo "FILE IS NOT EXECUTABLE. CHMODDING FILE"
	chmod +x "$filename"
fi
exit
