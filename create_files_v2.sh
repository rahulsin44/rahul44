#!/bin/bash

# Debug mode flag
DEBUG=false

# Function to print debug messages
debug_msg() {
    if [ "$DEBUG" = true ]; then
        echo "[DEBUG] $1"
    fi
}

# Function to create directory and files
create_files() {
    local directory="$1"
    local file_count="$2"
    
    # Check if directory exists
    if [ -d "$directory" ]; then
        echo "Directory '$directory' already exists."
        return 1
    fi
    
    # Create the directory
    mkdir -p "$directory"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory '$directory'."
        return 1
    else
        echo "Directory '$directory' created successfully."
    fi
    
    # Loop to create files
    for ((i = 1; i <= file_count; i++)); do
        filename="$directory/File${i}.txt"
        debug_msg "Creating file: $filename"
        
        # Create file and write filename into it
        echo "File${i}.txt" > "$filename"
        
        # Check if file creation was successful
        if [ $? -ne 0 ]; then
            echo "Error: Failed to create file '$filename'."
        else
            echo "File '$filename' created successfully."
        fi
    done
}

# Main script

# Check for debugging mode
if [ "$1" = "--debug" ]; then
    DEBUG=true
    shift
fi

# Check if directory and file count arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 [--debug] <directory_name> <number_of_files>"
    exit 1
fi

# Extract arguments
directory_name="$1"
number_of_files="$2"

# Call the function to create directory and files
create_files "$directory_name" "$number_of_files"
