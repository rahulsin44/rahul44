#!/bin/bash

# Loop through all files in the current directory starting with "T"
for file in T*; do
  # Check if the item is a file
  if [ -f "$file" ]; then
    # Change the group permissions to RWX
    chmod g-rwx "$file"
    echo "Changed permissions to RWX for group on file: $file"
  fi
done
