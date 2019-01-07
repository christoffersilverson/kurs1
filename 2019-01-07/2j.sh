#!/bin/bash
awk '$3 != "E2" {print $0}' emp2
