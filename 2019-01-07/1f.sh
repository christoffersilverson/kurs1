#!/bin/bash
echo -n "enter a starting value: "
read -e val
for ((i = $val ; i > 0; i--)); do
	echo -n "$i "
done
printf "\n"
exit
