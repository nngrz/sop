#!/bin/bash

for dir in ./*; do
    if [ -d $dir ]; then
        if [[ "$dir" == *[Cc]* ]]; then
            echo "$(basename $dir)"
        fi
    fi
done
