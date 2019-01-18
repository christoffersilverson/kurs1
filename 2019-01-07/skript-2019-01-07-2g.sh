#!/bin/bash
awk '$2 ~ /^B/ {print $0}' emp2 #print line if field 2 starts with B

