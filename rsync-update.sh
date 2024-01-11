#!/bin/bash
# Variables for the source and the desired directory
dir1="$1"
dir2="$2"
# Runs rsync, updating everything else that from the source, and keeping the files that aren't in the source
echo "Executing rsync delete"
rsync -av --update "$dir1" "$dir2"
# If the command worked, then a message will appear
if [ $? -eq 0 ]; then
  echo "Complete!"
# This appear only when the rsync command fails
else
  echo "The command failed!"
fi
