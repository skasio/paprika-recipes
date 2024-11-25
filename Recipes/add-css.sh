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

# CSS link tag to add
css_link='    <link rel="stylesheet" href="styles.css">'

# Use sed to add the CSS link after the <meta charset="UTF-8" /> line
sed '/<meta charset="UTF-8" \/>/a\
'"$css_link" "$file" >temp_file

# Replace the original file with the modified content
mv temp_file "$file"
echo "Added CSS link to $file"
