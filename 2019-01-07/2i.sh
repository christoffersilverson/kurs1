#!/bin/bash
awk '$5 >= 10000 && $5 <= 15000 {print $2}' emp2 > "file 1"
#print field 2 if field 5 is between 10000 and 15000 and redirect to 'file 1'
