#!/bin/bash

# Directory containing the .sh scripts (current directory)
SCRIPT_DIR="$(pwd)"
SELF_SCRIPT="$(basename "$0")"

# Ensure the directory exists
if [ ! -d "$SCRIPT_DIR" ]; then
  echo "Directory $SCRIPT_DIR does not exist."
  exit 1
fi

while true; do
  # Get a list of .sh files in the directory excluding this script and sort them alphabetically
  SCRIPTS=($(find "$SCRIPT_DIR" -maxdepth 1 -name "*.sh" ! -name "$SELF_SCRIPT" -exec basename {} \; | sort))

  # Check if there are any .sh files
  if [ ${#SCRIPTS[@]} -eq 0 ]; then
    echo "No .sh scripts found in $SCRIPT_DIR."
    exit 1
  fi

  # Display the list of scripts
  echo "Available scripts:"
  for i in "${!SCRIPTS[@]}"; do
    echo "$((i+1)). ${SCRIPTS[$i]}"
  done
  echo "$(( ${#SCRIPTS[@]} + 1 )). Exit"

  # Prompt the user to select a script to run
  read -p "Enter the number of the script you want to run (or 'q' to quit): " SCRIPT_NUMBER

  # Check if the user wants to quit
  if [[ "$SCRIPT_NUMBER" == "q" || "$SCRIPT_NUMBER" == "Q" || "$SCRIPT_NUMBER" -eq $(( ${#SCRIPTS[@]} + 1 )) ]]; then
    echo "Exiting."
    exit 0
  fi

  # Validate the user input
  if ! [[ "$SCRIPT_NUMBER" =~ ^[0-9]+$ ]] || [ "$SCRIPT_NUMBER" -lt 1 ] || [ "$SCRIPT_NUMBER" -gt "${#SCRIPTS[@]}" ]; then
    echo "Invalid selection. Please try again."
    continue
  fi

  # Get the selected script
  SELECTED_SCRIPT="${SCRIPTS[$((SCRIPT_NUMBER-1))]}"

  # Run the selected script
  echo "Running $SELECTED_SCRIPT..."
  chmod +x "$SCRIPT_DIR/$SELECTED_SCRIPT"
  "$SCRIPT_DIR/$SELECTED_SCRIPT"

  # Pause before showing the menu again
  read -p "Press any key to continue..."
done
