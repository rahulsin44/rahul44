#!/bin/bash

# Function to display the menu
display_menu() {
    echo "Menu:"
    echo "1. Add"
    echo "2. Delete"
    echo "3. View"
    echo "4. Exit"
}

# Function to handle adding an item
add_item() {
    echo "Adding item..."
    # Your add item logic here
}

# Function to handle deleting an item
delete_item() {
    echo "Deleting item..."
    # Your delete item logic here
}

# Function to handle viewing items
view_items() {
    echo "Viewing items..."
    # Your view items logic here
}

# Main loop
while true; do
    display_menu
    read -p "Please choose an option: " choice

    case $choice in
        1)
            add_item
            ;;
        2)
            delete_item
            ;;
        3)
            view_items
            ;;
        4)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

echo "Goodbye!"
