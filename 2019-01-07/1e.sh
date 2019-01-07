#!/bin/bash
for ((i = 10; i > 0; i--)); do
	echo -n "$i " 
done
printf "\n" #newline after done
exit
