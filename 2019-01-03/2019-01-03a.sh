#!/bin/bash
FILES=/etc/*
file_exists=0
date_today=$(date -d "now" +"%Y-%m-%d" )
for f in $FILES
do
	lastModified=$(stat $f | awk '$1 == "Modify:" {print $2}')
	compareDate=$(date -d "-2 days" +%s)
	lastModifiedDate=$(date -d $lastModified +%s)
	if [ $lastModifiedDate -ge $compareDate ]; then
		if [ $file_exists -eq 0 ]; then
			zip "$date_today.zip" anyfile
			zip -d "$date_today".zip anyfile
			file_exists=1
		fi
		zip -rv "$date_today.zip" "$f"
	fi
done
