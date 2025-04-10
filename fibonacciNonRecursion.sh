#!/bin/bash

# This script calculates the n-th Fibonacci number - without recursion

# Check if user provided an argument
if [ -z "$1" ] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <n>"
    echo "You should provide a non-negative integer."
    exit 1
fi

if [ "$1" -le 1 ]; then
    echo "$1"
    exit 0
fi

a=0
b=1
for ((i=2; i<=$1; i++)); do
    temp=$b
    b=$((a + b))
    a=$temp
done

echo "Fibonacci($1) = $b"
