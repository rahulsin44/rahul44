#!/bin/bash

# Define the process name to monitor
process_name="sleep"

# Continuously monitor the process
while true; do
    # Check if the process is running
    if pgrep -x "$process_name" >/dev/null; then
        # Process is running, do nothing
        sleep 1
    else
        # Process stopped running, display a message
        echo "Process $process_name stopped running!"
        # You can add further actions here, like restarting the process
        break  # Exit the loop after detecting the process has stopped
    fi
done
