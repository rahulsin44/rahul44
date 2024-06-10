#!/bin/bash

# Initialize the countdown variable
countdown=10

# Start the countdown
while [ $countdown -gt 0 ]
do
    echo $countdown
    countdown=$((countdown - 1))
done

# Print "Boom!" after the countdown reaches zero
echo "Boom!"

