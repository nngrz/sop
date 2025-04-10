#!/bin/bash

# This script merges and sorts the contents of two text files lexicographically (case-insensitive).
# Usage: ./merge_sorts.sh file1.txt file2.txt

file1="$1"
file2="$2"

cat "$file1" "$file2" | sort -f
