#!/bin/bash
for ((i = $1; i > 0; i--)) do #loop from command line arg val to 0
	echo -n "$i "
done
printf "\n"
exit

