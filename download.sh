#!/bin/bash

# Check if urls.txt exists
if [ ! -f "urls.txt" ]; then
    echo "Error: urls.txt not found"
    exit 1
fi

# Read each URL from urls.txt and download the corresponding file
while IFS= read -r url; do
    echo "Downloading $url"
    wget "$url"
done < "urls.txt"

echo "Download complete"
