#!/bin/bash
awk '$2 ~ /^B/ {print $0}' emp2

