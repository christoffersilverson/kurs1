#!/bin/bash

function isInt() {
    case $1 in
    ''|*[!0-9]*) echo "not a number." ;;
	# matchar tomma strängar och
	# strängar med icke-siffror
    *) echo "is a number" ;;
esac
}

isInt "$1"
