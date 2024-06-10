#!/bin/bash

# Function to count the number of lines in a file
count_lines_in_file() {
    local filename=$1
    local line_count=$(wc -l < "$filename")
    echo "Number of lines in $filename: $line_count"
}

# Call the function with different filenames
count_lines_in_file "b.txt"
count_lines_in_file "calculator.c"
