#!/bin/bash

function isInt() {
    case $1 in
    ''|*[!0-9]*) echo "not a number." ;;
	#this case matches strings containing non-numbers and empty strings
	return 1
    *) echo "is a number" ;;
	#if not matched then its a number
	return 0
esac
}

isInt "$1"
