#!/bin/bash

# Check if the user provided a URL as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Store the URL provided by the user
URL=$1

# Send a GET request to the URL using curl and store the response body in a temporary file
RESPONSE_BODY=$(mktemp)
curl -s -o "$RESPONSE_BODY" -w "%{size_download}" "$URL"

# Display the size of the response body in bytes
SIZE=$(cat "$RESPONSE_BODY")
echo "Size of the response body: $SIZE bytes"

# Clean up temporary files
rm "$RESPONSE_BODY"
