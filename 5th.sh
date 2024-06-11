#!/bin/bash

# Enable debugging if DEBUG environment variable is set
if [ "$DEBUG" == "true" ]; then
    set -x
fi

# Function to check if a directory exists
check_directory() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' does not exist."
        exit 1
    fi
}

# Function to check if the script has write permissions for a directory
check_write_permission() {
    local dir="$1"

    if [ ! -w "$dir" ]; then
        echo "Error: No write permission for directory '$dir'."
        exit 1
    fi
}

# Function to traverse directory and display file sizes
traverse_directory() {
    local dir="$1"
    
    check_directory "$dir"
    check_write_permission "$dir"

    for item in "$dir"/*; do
        if [ -d "$item" ]; then
            traverse_directory "$item"
        elif [ -f "$item" ]; then
            filesize=$(stat -c%s "$item" 2>/dev/null)
            if [ $? -ne 0 ]; then
                echo "Error: Unable to get size for file '$item'."
                continue
            fi
            echo "File: $item, Size: $filesize bytes"
        fi
    done
}

# Main script logic
start_directory="${1:-.}"

echo "Starting traversal from: $start_directory"
traverse_directory "$start_directory"

echo "Script completed successfully."
