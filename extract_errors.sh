#!/bin/bash

# Sample log file
log_file="sample.log"

# Use grep to extract lines containing "ERROR" and pipe the output to awk
grep "ERROR" "$log_file" | awk '{
    # Extract date and time using awk's substr function
    date_time=substr($1, 2) " " substr($2, 1, length($2)-1)
    
    # Print date, time, and error message
    printf("Date: %s, Time: %s, Error: ", date_time, $3)
    for (i=4; i<=NF; i++) {
        printf("%s ", $i)
    }
    printf("\n")
}'
