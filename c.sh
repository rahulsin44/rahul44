#!/bin/bash

# Check if a filename was provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Get the filename from the command line argument
filename="$1"

# Check if the file exists in the current directory
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found!"
    exit 1
fi

# Overwrite the file with the content "AAAAAAAA"
echo "AAAAAAAA" > "$filename"

# Confirm the file has been modified
echo "File '$filename' has been modified."
