#!/bin/bash

# Prompt the user to enter a positive number
read -p "Please enter a positive number: " number

# While loop to validate the user input
while [[ ! $number =~ ^[0-9]+$ ]] || [[ $number -le 0 ]]; do
    echo "Invalid input. Please enter a positive number."
    read -p "Please enter a positive number: " number
done

echo "You entered a positive number: $number"
