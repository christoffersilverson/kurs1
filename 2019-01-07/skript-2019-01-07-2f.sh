#!/bin/bash

awk '$2 ~ /Smith/ {print $0}' emp2
#print line if col 2 contains "Smith"
