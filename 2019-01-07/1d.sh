#!/bin/bash
echo "WELCOME, SELECT SOMETHING FROM THE MENU BELOW: "
printf "1. ls\n2. pwd\n3. ls -l\n4. ps -fe\n"
input=0
while [[ ! ("$input" -ge 1 && "$input" -le 4) ]]; do
	read -n1 input
done
printf "\n"
case "$input" in
1) ls
;;
2) pwd
;;
3) ls -l
;;
4) ps -fe
;;
esac
exit
