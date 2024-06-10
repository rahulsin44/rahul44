#!/bin/bash

# Define the filename
filename="b.txt"

# Check if the file exists in the current directory
if [ -f "$filename" ]; then
    echo "File exists"
else
    echo "File not found"
fi
