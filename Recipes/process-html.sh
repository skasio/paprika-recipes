#!/bin/bash

# Check if both scripts exist
if [[ ! -x "./remove-styles.sh" ]]; then
  echo "Error: remove-styles.sh not found or not executable!"
  exit 1
fi

if [[ ! -x "./add-css.sh" ]]; then
  echo "Error: add-css.sh not found or not executable!"
  exit 1
fi

# Loop through all .html files in the current directory
for file in *.html; do
  # Check if the file exists to handle the case of no matches
  if [[ ! -f "$file" ]]; then
    echo "No HTML files found in the directory."
    exit 0
  fi

  echo "Processing $file..."

  # Call the remove-styles script
  ./remove-styles.sh "$file"

  # Call the add-css script
  ./add-css.sh "$file"

  echo "$file processed successfully!"
done
