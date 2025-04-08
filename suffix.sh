#!/bin/bash

# This Script copies all files ending with ~ to a BACKUP directory (creates it if needed).

BACKUP_DIR="BACKUP"

# Check if BACKUP exist
if [ -e "$BACKUP_DIR" ]; then
    # If BACKUP exist but not a folder, report an error
    if [ ! -d "$BACKUP_DIR" ]; then
        echo "Error: '$BACKUP_DIR' exists but it not a directory."
        exit 1
    fi
else
    # Create the BACKUP folder if it doesn't exist
    mkdir "$BACKUP_DIR"
    # Checks the exit status of the mkdir command. If it's not 0 meaning an error occurred.
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory '$BACKUP_DIR'."
        exit 1
    fi
    echo "Created directory '$BACKUP_DIR'."
fi

# Find and copy files with the ~ suffix in the current directory
# Count how many files end with ~
count=0
for file in *~; do
    # Skip if no ~ files exist
    [ -e "$file" ] || continue
    cp "$file" "$BACKUP_DIR/"
    ((count++))
done

# If count = 0, means no file end with ~
if [ $count -eq 0 ]; then
    echo "No files with suffix ~ found. Nothing copied."
else
    echo "Copied $count file(s) with suffix ~ to BACKUP directory."
fi
