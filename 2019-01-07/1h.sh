#!/bin/bash
mapfile -t arr < <(ls *.txt)
for txt in "${arr[@]}"; do
	mv "$txt" "$txt.old" 
done
exit
