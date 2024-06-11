#!/bin/bash

# Directory to monitor
monitor_dir="/mnt/c/Users/'Rahul shingh'/Desktop/NGA_training/"

# Directory to store backups
backup_dir="/mnt/c/Users/'Rahul shingh'/Desktop/NGA_training/backup/"

# Start an infinite loop to continuously monitor the directory
while true; do
    # Use inotifywait to wait for file creation events in the monitored directory
    file=$(inotifywait -q -e create --format "%f" "$monitor_dir")

    # Display a message indicating a new file is added
    echo "New file detected: $file"

    # Create a backup of the new file in the backup directory
    cp "$monitor_dir/$file" "$backup_dir"

    # Display a message indicating the backup is created
    echo "Backup created for $file"
done
