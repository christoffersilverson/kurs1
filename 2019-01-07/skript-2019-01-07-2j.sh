#!/bin/bash
awk '$3 != "E2" {print $0}' emp2
#print line if field 3 is not equal to E2
