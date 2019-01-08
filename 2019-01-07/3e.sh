#!/bin/bash
#set -x
function isMagic() {
	#loop over every num in the array
	var=0
	arr2=("$@")
	for j in "${arr2[@]}" ; do #sum all the digits in the number
		let "var=var+j"
	done
	if [ $var == "7" ]; then
		return 0 #return success if magic number is found
	elif [ ${#var} -gt 1 ]; then
		m=0
		while [ $m -lt ${#var} ]; do n[$m]=${var:$m:1}; m=$((m+1));done #converts a string $var into array of characters
		isMagic "${n[@]}" #call isMagic recursively
	else
		return 1 #return fail if number isnt magic
	fi
}
for (( x=1000 ; x <= 10000; x++ )); do #loopa 1000 -> 10000
	l=0
	while [ $l -lt ${#x} ]; do y[$l]=${x:$l:1};  l=$((l+1));done #converts a string $x in to array of characters
	isMagic "${y[@]}" && echo "$x is magic!"
done
