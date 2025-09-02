#!/bin/bash

for dir in ./*; do
    if [ -d "$dir" ]; then
        name=$(basename $dir)
        count=${#name}
        if [ "$count" -ge 4 ]; then
            echo "$name"
        fi
    fi
done
