#!/bin/bash
mapfile -t arr < <(ls *.txt) #map list of files ending in .txt to array
for txt in "${arr[@]}"; do #mv to change filename
	mv "$txt" "$txt.old"
done
exit
