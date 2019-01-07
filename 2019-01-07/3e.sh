#!/bin/bash
#set -x
function isMagic() {
	#loop over every num in the array
	var=0
	arr2=$1
	len="${#arr2[@]}"
	echo len
	for(( k = 0 ; k < $len ; k++ )); do
		var=$((var+$1[$k]))
	done
	if [ var == 7 ]; then
		return 1
	elif [ ${#var} -gt 1 ]; then
		var=$(echo $var | fold -w1)
		isMagic "${var[@]}" #rekursiv galenskap
	else
		return 0
	fi
}
for (( i=1000 ; i <= 10000; i++ )); do #loopa 1000 -> 10000
	arr=$( echo $i | fold -w1 ) #konvertera till array
	isMagic "${arr[@]}" #is magic?
done
