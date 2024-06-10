#!/bin/bash

# Create the directory TestDir if it doesn't exist
mkdir -p TestDir

# Loop to create ten files
for ((i = 1; i <= 10; i++)); do
    filename="TestDir/File${i}.txt"
    echo "Creating file $filename with content '$filename'"
    echo "$filename" > "$filename"
done

echo "Files created successfully."
