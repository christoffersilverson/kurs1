#!/bin/bash
#set -x
function isMagic() {
	#loop over every num in the array
	var=0
	arr2=("$@")
	#echo $arr2
	for j in "${arr2[@]}" ; do
		#echo "var: $var"
		echo "j: $j"
		let "var=var+j"
		echo "var: $var"
	done
	if [ var == 7 ]; then
		echo "value is magic!"
		return 1
	elif [ ${#var} -gt 1 ]; then
		#var=$(echo $var | fold -w1)
		#echo "recursing"
		#isMagic "${var[@]}" #rekursiv galenskap
	else
		return 0
	fi
}
for (( x=1000 ; x <= 10000; x++ )); do #loopa 1000 -> 10000
	l=0
	while [ $l -lt ${#x} ]; do y[$l]=${x:$l:1};  l=$((l+1));done
	echo "arr: ${y[@]}"
	isMagic "${y[@]}" #is magic?
done
