#!/bin/bash

for file in ./*; do
    if [ -f "$file" ]; then
        if ! grep -q "^/\*main\*/" "$file"; then
            echo "$(basename "$file")"
        fi
    fi
done
