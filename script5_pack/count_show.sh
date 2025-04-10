#!/bin/bash

# This script counts and shows content of the file.
# The file must contain only numbers (one nubmer per line).

# Example Usage:
# $ ./count_show.sh
# Enter the filename: numbers.txt
# Number of unique numbers: 7
# Number of repetitive numbers: 4

read -p "Enter the filename: " filename

# Check if the file exits
if [ ! -f "$filename" ]; then
    echo "File $filename not found."
    exit 1
fi

# Check if the file empty
if [ ! -s "$filename" ]; then
    echo "File $filename is empty."
    exit 0
fi

# Count unique numbers
unique_numbers=$(sort "$filename" | uniq | wc -l | xargs)

# Count total lines
total_lines=$(wc -l < "$filename")

# Count reptitive numbers
reptitive_numbers=$(( total_lines - unique_numbers ))

echo "Number of unique numbers: $unique_numbers"
echo "Number of repetitive numbers: $reptitive_numbers"
