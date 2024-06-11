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

# Function to display the content of a directory
display_directory_content() {
    echo "Enter the directory path:"
    read dirpath

    if [ -d "$dirpath" ]; then
        echo "Displaying the contents of directory $dirpath:"
        ls -l "$dirpath"
    else
        echo "Directory not found: $dirpath"
    fi
}

# Function to search for a string in a file
search_string_in_file() {
    echo "Enter the string to search for:"
    read searchString
    echo "Enter the filename:"
    read filename

    if [ -f "$filename" ]; then
        count=$(grep -o "$searchString" "$filename" | wc -l)
        echo "The string '$searchString' occurred $count times in the file '$filename'."
    else
        echo "File not found: $filename"
    fi
}

# Main menu
echo "Select an option:"
echo "1. Display file content"
echo "2. Display directory content"
echo "3. Search for a string in a file"
echo "4. Exit"

read choice

case $choice in
    1)
        display_file_content
        ;;
    2)
        display_directory_content
        ;;
    3)
        search_string_in_file
        ;;
    4)
        echo "Exiting..."
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
