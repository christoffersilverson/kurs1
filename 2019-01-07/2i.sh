#!/bin/bash
awk '$5 >= 10000 && $5 <= 15000 {print $2}' emp2 > "file 1"
