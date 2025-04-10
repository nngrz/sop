#!/bin/bash

# This script finds all files in the current directory whose name appears in the content.

# Example Usage:
# Create a file named 'test.txt' with the word 'test.txt' inside, then run: ./filename.sh

for file in *; do
    # Skip if not a regular file
    if [ -f "$file" ]; then
        if grep -q "$file" "$file"; then
            echo "File $file contains its name in the content."
        fi
    fi
done
