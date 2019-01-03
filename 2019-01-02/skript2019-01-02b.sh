#!/bin/bash
var="${1##*/}"


if [ ! -f $var ]; then
	wget $1
fi
if [ ! -d $2 ]; then
	mkdir $2
fi

unzip "$var" -d "./$2/"
