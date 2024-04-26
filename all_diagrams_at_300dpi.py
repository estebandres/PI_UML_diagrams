import os
import sys

def add_text_to_files(directory):
    # Iterate through all files in the directory
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)
        # Check if the item is a file
        if os.path.isfile(filepath):
            # Open the file for reading
            with open(filepath, 'r') as file:
                # Read all lines from the file
                lines = file.readlines()
            # Insert the text as the 3rd line
            lines.insert(1, "skinparam dpi 300\n")
            # Open the file for writing and overwrite its contents
            with open(filepath, 'w') as file:
                # Write the modified lines back to the file
                file.writelines(lines)

if __name__ == "__main__":
    # Check if the user provided the directory path as an argument
    if len(sys.argv) != 2:
        print("Usage: python script.py directory_path")
        sys.exit(1)

    # Get the directory path from the command-line argument
    directory_path = sys.argv[1]

    # Check if the directory exists
    if not os.path.isdir(directory_path):
        print("Error: Directory not found.")
        sys.exit(1)

    # Call the function to add the text to files in the directory
    add_text_to_files(directory_path)