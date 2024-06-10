#!/bin/bash

# Function to check if the password meets the criteria
validate_password() {
    local password="$1"
    local min_length=8

    # Check if password length is at least 8 characters
    if [ ${#password} -lt $min_length ]; then
        echo "Password must be at least 8 characters long."
        return 1
    fi

    # Check if password contains at least one digit
    if ! echo "$password" | grep -q '[0-9]'; then
        echo "Password must contain at least one digit."
        return 1
    fi

    # Check if password contains at least one uppercase letter
    if ! echo "$password" | grep -q '[A-Z]'; then
        echo "Password must contain at least one uppercase letter."
        return 1
    fi

    # Check if password contains at least one special character
    if ! echo "$password" | grep -q '[!@#$%^&*(),.?":{}|<>]'; then
        echo "Password must contain at least one special character."
        return 1
    fi

    return 0
}

# Main script
while true; do
    read -p "Enter your password: " password
    if validate_password "$password"; then
        echo "Password is valid."
        break
    fi
done
