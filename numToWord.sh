#!/bin/bash

# This script converts a number (0–99) to its word representation

# Example Usage:
# ./numToWord.sh 25  # Output: twenty-five

# Function to convert 0 - 9
digit_to_word() {
    local digit=$1
    case "$digit" in 
        0) echo "zero" ;;
        1) echo "one" ;;
        2) echo "two" ;;
        3) echo "three" ;;
        4) echo "four" ;;
        5) echo "five" ;;
        6) echo "six" ;;
        7) echo "seven" ;;
        8) echo "eight" ;;
        9) echo "nine" ;;
        *) echo "" ;;
    esac
}

# Function to convert 10 - 19
teens_to_words() {
    local teen="$1"
    case "$teen" in 
        10) echo "ten" ;;
        11) echo "eleven" ;;
        12) echo "twelve" ;;
        13) echo "thirteen" ;;
        14) echo "fourteen" ;;
        15) echo "fifteen" ;;
        16) echo "sixteen" ;;
        17) echo "seventeen" ;;
        18) echo "eighteen" ;;
        19) echo "nineteen" ;;
        *) echo "" ;;
    esac
}

# Function to convert 20 - 99
tens_to_words() {
    local ten="$1"
    case "$ten" in
        2) echo "twenty" ;;
        3) echo "thirty" ;;
        4) echo "forty" ;;
        5) echo "fifty" ;;
        6) echo "sixty" ;;
        7) echo "seventy" ;;
        8) echo "eighty" ;;
        9) echo "ninety" ;;
        *) echo "" ;;
    esac
}

number_to_words() {
    local number="$1"

    # Check if the user provided number is valid
    if [ -z "$number" ] || ! [[ "$number" =~ ^[0-9]+$ ]] || [ "$number" -lt 0 ] || [ "$number"  -gt 99 ]; then
        echo "Usage: $0 <number from 0 to 99>"
        exit 1
    fi

    if ((number < 10)); then
        digit_to_word "$number"
    elif ((number < 20)); then
        teens_to_words "$number"
    else 
        local tens=$((number / 10))
        local ones=$((number % 10))
        local tens_word=$(tens_to_words "$tens")
        local ones_word=$(digit_to_word "$ones")

        if ((ones == 0)); then
            echo "$tens_word"
        else
            echo "$tens_word-$ones_word"
        fi
    fi
    return 0
}

number_to_words "$1"
