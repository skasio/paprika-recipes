#!/bin/bash

# Check if the user provided a file
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# File to process
file="$1"

# Check if the file exists
if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' not found!"
  exit 1
fi

# Use sed to delete everything between <style> and </style>, inclusive
sed ':a; /<style[^>]*>/,/<\/style>/ { /<\/style>/! { N; ba; }; d; }' "$file" >temp_file

# Replace the original file with the modified content
mv temp_file "$file"
echo "Removed <style> contents from $file"
