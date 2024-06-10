#!/bin/bash

# Function to traverse directory
traverse_directory() {
    for item in "$1"/*; do
        if [ -d "$item" ]; then
            # If the item is a directory, recursively traverse it
            traverse_directory "$item"
        elif [ -f "$item" ]; then
            # If the item is a file, display its name and size
            filesize=$(stat -c%s "$item")
            echo "File: $item, Size: $filesize bytes"
        fi
    done
}

# Start traversal from the specified directory or current directory if none specified
start_directory="${1:-.}"
traverse_directory "$start_directory"
