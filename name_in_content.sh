#!/bin/bash

# This script finds and lists files in the current directory that contain their own filename within their content.

# Example Usage:
# Create 'my_document.txt' with 'my_document.txt' inside, then run: ./name_in_content.sh

for file in *; do
    if [ -f "$file" ]; then
        # -q (quiet): Suppresses normal output; grep only returns an exit status.
        # -i (ignore-case): Makes the search case-insensitive.
        if grep -qi "$file" "$file"; then
            echo "File '$file' include its name in the content."
        fi
    fi
done
