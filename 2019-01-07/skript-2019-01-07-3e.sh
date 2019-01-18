#!/bin/bash
function isLucky() {
	#loop over every num in the array
	var=0
	arr2=("$@")
	for j in "${arr2[@]}" ; do #sum all the digits in the number
		let "var=var+j"
	done
	if [ $var == "7" ]; then
		return 0 #return success if lucky number is found
	elif [ ${#var} -gt 1 ]; then #if length of number(string) is above 1, ie: number is above 10
		m=0
		while [ $m -lt ${#var} ]; do n[$m]=${var:$m:1}; m=$((m+1));done #converts a string $var into array of characters
		isLucky "${n[@]}" #call isLucky recursively
	else
		return 1 #return fail if number isnt lucky
	fi
}
for (( x=1000 ; x <= 10000; x++ )); do #loop 1000 -> 10000
	l=0
	while [ $l -lt ${#x} ]; do y[$l]=${x:$l:1};  l=$((l+1));done #converts a string $x in to array of characters
	isLucky "${y[@]}" && echo "$x is lucky!" #call function isLucky and echo $x on successful return
done
