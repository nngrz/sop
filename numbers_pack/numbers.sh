#!/bin/bash

# This script finds the min, max, and sum of numbers in the given file

# Check if a filename is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

file="$1"

# Check if file exists
if [ ! -f "$file" ]; then
    echo "Error: '$file' do not exists"
    exit 1
fi

# Check if file is empty
if [ ! -s "$file" ]; then
    echo "The file $file is empty."
    exit 0
fi

min=
max=
sum=

while IFS= read -r line; do
    # Skip empty lines
    if [[ -z "$line" ]]; then
        continue
    fi
    
    num=$line

    if [ -z "$min" ] || [ "$num" -lt "$min" ]; then
        min=$num
    fi

    if [ -z "$max" ] || [ "$num" -gt "$max" ]; then
        max=$num
    fi

    sum=$((sum + num))
done < "$file"

echo "File: $file"
echo "Mininum: $min"
echo "Maximum: $max"
echo "Sum: $sum"
