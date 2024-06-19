#!/bin/bash

# Directory containing the .sh scripts (current directory)
SCRIPT_DIR="$(pwd)"

# Ensure the directory exists
if [ ! -d "$SCRIPT_DIR" ]; then
  echo "Directory $SCRIPT_DIR does not exist."
  exit 1
fi

# Get a list of .sh files in the directory
SCRIPTS=($(ls "$SCRIPT_DIR"/*.sh 2>/dev/null))

# Check if there are any .sh files
if [ ${#SCRIPTS[@]} -eq 0 ]; then
  echo "No .sh scripts found in $SCRIPT_DIR."
  exit 1
fi

# Display the list of scripts
echo "Available scripts:"
for i in "${!SCRIPTS[@]}"; do
  script_name=$(basename "${SCRIPTS[$i]}")
  echo "$((i+1)). $script_name"
done

# Prompt the user to select a script to run
read -p "Enter the number of the script you want to run: " SCRIPT_NUMBER

# Validate the user input
if ! [[ "$SCRIPT_NUMBER" =~ ^[0-9]+$ ]] || [ "$SCRIPT_NUMBER" -lt 1 ] || [ "$SCRIPT_NUMBER" -gt "${#SCRIPTS[@]}" ]; then
  echo "Invalid selection. Exiting."
  exit 1
fi

# Get the selected script
SELECTED_SCRIPT="${SCRIPTS[$((SCRIPT_NUMBER-1))]}"

# Run the selected script
echo "Running $SELECTED_SCRIPT..."
chmod +x "$SELECTED_SCRIPT"
"$SELECTED_SCRIPT"
