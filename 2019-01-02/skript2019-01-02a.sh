#!/bin/bash
if [ ! -d "$1" ]; then #existerar directoryn?
	mkdir $1
fi
touch $2 #skapa fil
mv $2 $1 #flytta den
exit
