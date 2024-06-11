#!/bin/bash

# Function to display the content of the file
display_file_content() {
    echo "Enter the filename:"
    read filename

    if [ -f "$filename" ]; then
        echo "Displaying the contents of $filename:"
        cat "$filename"
    else
        echo "File not found: $filename"
    fi
}

# Main menu
echo "Select an option:"
echo "1. Display file content"
echo "2. Exit"

read choice

case $choice in
    1)
        display_file_content
        ;;
    2)
        echo "Exiting..."
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
