#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

file=$1

if [ ! -f "$file" ]; then
    echo "No regular file"
    exit 1
fi

number_count=0
letter_count=0 
sum=0

while read -r line; do
    for token in $line; do
        # get sum of all numbers
        if [[ "$token" =~ ^[0-9]+$ ]]; then
            ((sum += token))
        fi

        token_length=${#token} # get the length of the current token

        for (( i=0; i<token_length; i++)); do
            # extract one character at a time using substring expansion
            char="${token:$i:1}"

            if [[ "$char" =~ ^[0-9]$ ]]; then
                ((number_count++))
            elif [[ "$char" =~ ^[a-zA-Z]$ ]]; then
                ((letter_count++))
            fi
        done
    done
done < "$file"

echo "The file $file contains $number_count numbers and $letter_count letters."
echo "The sum of all numbers is $sum"
