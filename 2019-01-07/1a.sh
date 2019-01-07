#!/bin/bash

mapfile -t arr < <(who | awk '{print $1}')
echo -n "Enter name to check: "
read -e input
matched=false
for uu in "${arr[@]}"
do
	if [ $uu = $input ];
	then
		matched=true
	fi
done

if [[ "$matched" = true ]]; then
	echo "USER $input IS LOGGED IN."
	exit
fi
echo "USER $input IS NOT LOGGED IN"
exit
