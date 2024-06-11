#!/bin/bash

# Thresholds for resource usage (you can adjust these as needed)
CPU_THRESHOLD=80  # percentage
MEMORY_THRESHOLD=80  # percentage
DISK_THRESHOLD=90  # percentage

# Log file for recording resource usage
LOG_FILE="system_monitor.log"

# Function to log resource usage
log_resource_usage() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - CPU Usage: $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')% - Memory Usage: $(free | grep Mem | awk '{print $3/$2 * 100.0}')% - Disk Usage: $(df -h | awk '$NF=="/"{print $5}' | sed 's/%//')" >> "$LOG_FILE"
}

# Function to send alert if any resource exceeds the threshold
send_alert() {
    alert_message=""

    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    disk_usage=$(df -h | awk '$NF=="/"{print $5}' | sed 's/%//')

    if (( $(printf "%.0f" "$cpu_usage") > CPU_THRESHOLD )); then
        alert_message+="High CPU usage! "
    fi

    if (( $(printf "%.0f" "$memory_usage") > MEMORY_THRESHOLD )); then
        alert_message+="High memory usage! "
    fi

    if (( "$disk_usage" > DISK_THRESHOLD )); then
        alert_message+="High disk usage! "
    fi

    if [ -n "$alert_message" ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - ALERT: $alert_message" >> "$LOG_FILE"
        # You can add additional logic here to send an alert via email, SMS, etc.
        echo "$alert_message"
    fi
}

# Main loop to continuously monitor and log resource usage
while true; do
    log_resource_usage
    send_alert
    sleep 300  # Sleep for 5 minutes (adjust as needed)
done
