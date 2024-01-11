#!/bin/bash
# Variables for the source and the desired directory
dir1="$1"
dir2="$2"
# Runs rsync, deleting everything else that isn't in the source, making a identical copy
echo "Executing rsync delete"
rsync -av --delete "$dir1" "$dir2"
# If the command worked, then a message will appear
if [ $? -eq 0 ]; then
  echo "Complete!"
# An extra command may be run if desired, which looks for differences in both directories
# making sure they are identical, if not, showing you were are the differences
  read -p "Do you want to make sure both dirs are indeed identical? (y/n): " choice
  if [ "$choice" = "y" ]; then
    echo "Running diff"
    diff -r "$dir1" "$dir2"
# If the command worked, then a message will appear
        if [ $? -eq 0 ]; then
        echo "Complete!"
      fi
# This appear when the diff command isn't chosen
  else
    echo "Skipped"
  fi
# This appear only when the rsync command fails
else
  echo "The command failed!"
fi
