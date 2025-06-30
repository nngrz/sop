#!/bin/bash

for file in *; do
    # Check if the current item is a regular file
    if [ -f "$file" ]; then
        if ! grep -q "^/\*main\*/" "$file"; then
            echo "$file"
        fi
    fi
done
