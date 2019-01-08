#!/bin/bash
awk '$3=="E2" && $4>=2 && $4<=5 {print $0}' emp2 #print line if field 3 is E2 and field 4 is between 2 and 5
