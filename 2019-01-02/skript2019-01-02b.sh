#!/bin/bash
var="${1##*/}" #substring som matchar filnamnet i URLen


if [ ! -f $var ]; then #finns filen redan?
	wget $1 
fi
if [ ! -d $2 ]; then
	mkdir $2
fi

unzip "$var" -d "./$2/" #unzippa arkivet
