#!/bin/bash

for dir in ./*; do
    if [ -d "$dir" ]; then
        count=0; # reset for each directory
        for file in "$dir"/*; do
            if [ -f "$file" ] && [ -r "$file" ]; then
                ((count++))
            fi
        done

        if [[ "$count" -ge 1 ]]; then
            echo "Directory $(basename $dir) has $count readable files"
        else
            echo "Directory $(basename $dir) has 0 readable files"
        fi
    fi
done
