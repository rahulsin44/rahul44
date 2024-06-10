#!/bin/bash

# Check if the file 'data.txt' exists
if [ ! -f b.txt ]; then
    echo "File data.txt not found!"
    exit 1
fi

# Initialize line number
line_number=1

# Read each line from the file
while IFS= read -r line; do
    echo "${line_number}: $line"
    ((line_number++))
done < data.txt
