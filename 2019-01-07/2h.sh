#!/bin/bash
awk '$3=="E2" && $4>=2 && $4<=5 {print $0}' emp2
