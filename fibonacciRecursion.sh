#!/bin/bash

# This script calculates the n-th Fibonacci number - with recursion

fibonacci() {

    if [ "$1" -le 1 ]; then
        echo "$1"
    else
        local prev1=$(fibonacci "$(( $1 - 1 ))")
        local prev2=$(fibonacci "$(( $1 - 2 ))")
        echo $((prev1 + prev2))
    fi
}

# Check if user provided an argument
if [ -z "$1" ] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 <n>"
    echo "You should provide a non-negative integer."
    exit 1
fi 

# Call the recursive function
result=$(fibonacci "$1")
echo "Fibonacci($1) = $result"
