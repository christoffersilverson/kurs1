#!/bin/bash

function isMagic() {
	#loop over every num in the array
	var=0
	arr2=("$*")
	#echo $arr2
	for j in "${arr2[*]}" ; do
		echo "var: $var"
		echo "j: $j"
		#let "var=var+k"
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
	echo "arr: $arr"
	isMagic "${arr[@]}" #is magic?
done
