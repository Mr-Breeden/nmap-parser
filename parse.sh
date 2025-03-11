#!/bin/bash

# Check if the user provided a filename as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <nmap_results_file>"
    exit 1
fi

# Extract relevant lines from the Nmap results and process them
grep 'Ports' "$1" | awk '
{
    printf "%s\t", $2;  # Print the second field (IP address) followed by a tab
    first = 1;  # Flag to track whether we need to prepend a comma
    
    for (i = 4; i <= NF; i++) {  # Loop through fields starting from the 4th one
        split($i, a, "/");  # Split the field using "/" as a delimiter
        if (a[2] == "open") {  # Check if the port is open
            if (first) {
                printf "%s", a[1];  # Print the first open port without a comma
                first = 0;  # Update flag after the first port
            } else {
                printf ",%s", a[1];  # Print subsequent open ports with a comma
            }
        }
    }
    print "";  # Print a newline after processing each host
}'
