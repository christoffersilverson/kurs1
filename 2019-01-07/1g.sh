#!/bin/bash
for ((i = $1; i > 0; i--)) do
	echo -n "$i "
done
printf "\n"
exit
