#!/bin/bash
for ((i = 10; i > 0; i--)); do #loop 10-1
	echo -n "$i "
done
printf "\n" #newline after done
exit
