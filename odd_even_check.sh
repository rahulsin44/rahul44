#!/bin/bash

# Function to check if a number is odd or even
check_odd_or_even() {
    local num=$1
    if (( num % 2 == 0 )); then
        echo "$num is even"
    else
        echo "$num is odd"
    fi
}

# Read numbers from the user until they enter '0'
while true; do
    read -p "Enter a number (0 to quit): " number
    
    # Check if the number is '0'
    if [[ $number -eq 0 ]]; then
        echo "Exiting..."
        break
    fi
    
    # Check if the input is a valid number
    if ! [[ $number =~ ^-?[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid number."
        continue
    fi
    
    # Check if the number is odd or even
    check_odd_or_even $number
done

