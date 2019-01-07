#!/bin/bash
function isMagic() {
	#loop over every num in the array
	var=0
	for((k = 0 ; k < ="${#$1[@]}" ; k++ )); do
		var=$((var+$1[$k]))
	done
	if [ var == 7 ]; then
		return 1
	elif [ ${#var} -gt 1 ]
		var=$(cat $var | fold -w1)
		isMagic "$[var[@]}"
	fi
}
for ((i=1000 ; i <= 10000; i++)); do
	arr=$(cat $i | fold -w1)
	isMagic "${arr[@]}"
done

