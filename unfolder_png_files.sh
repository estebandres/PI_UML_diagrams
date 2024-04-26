#!/bin/bash
# EXECUTION EXAMPLE
# ./unfolder_svg_files.sh out/class_diagrams/

# Check if the user provided the parent directory as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 parent_directory"
    exit 1
fi

# Check if the parent directory starts with "out/"
if [[ ! "$1" =~ ^out/ ]]; then
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

find_count=""
find_count=$(find "$parent_dir" -type f -name "*.png" -exec mv -t "$parent_dir" {} + -print | wc -l)

#echo "COUNTER $find_count"

declare -i counter=0

#cast string type to int
counter=$((find_count))
#echo "INTEGER COUNTER= $counter"

echo "FOUND $counter PNG FILES."
# Check if no files were moved
if [ $find_count == "" ]; then
    echo "No PNG files found in $parent_dir directory."
    exit 0
fi


# Check if no files were moved
if [ "$counter" -eq 0 ]; then
    echo "No PNG files found in $parent_dir directory."
    exit 0
fi


sleep 1
echo "remove all subfolders."

rm -r "$parent_dir"/*/

echo "Unfoldering finished for: $parent_dir "