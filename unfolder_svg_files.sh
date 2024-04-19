#!/bin/bash

# Check if the user provided the parent directory as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 parent_directory"
    exit 1
fi

# Check if the parent directory starts with "out/"
if [[ ! "$parent_dir" =~ ^out/ ]]; then
    echo "Error: The directory provided must start with 'out/'."
    exit 1
fi

# Assign the provided parent directory argument
parent_dir="$1"

echo "Directory argument is:__ $parent_dir __"

# Check if the parent directory exists
if [ ! -d "$parent_dir" ]; then
    echo "Error: Directory '$parent_dir' not found."
    exit 1
fi

find "$parent_dir" -type f -name "*.svg" -exec mv -t "$parent_dir" {} +
sleep 1
echo "remove all subfolders."

rm -r "$parent_dir"/*/

echo "Unfoldering finished for: $parent_dir "