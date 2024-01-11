#!/bin/bash
# Variables for the source and the desired directories
dir1="$1"
dir2="$2"
# Prompts for a choice
read -p "Do you want to update the content or delete the data that isn't present in the source? (updt/del): " choice

if [ "$choice" = "updt" ]; then
    echo "Running rsync -av --update"
    rsync -av --update "$dir1" "$dir2"

    # If the command worked, then a message will appear
    if [ $? -eq 0 ]; then
        echo "Complete!"

        # An extra command may be run if desired, which looks for differences in both directories
        # making sure they are identical, if not, showing where are the differences or simply show
        # what content has in one directory that isn't present in the other one
        read -p "Do you want to extra run a diff command to show directories differences? (y/n): " choice
        if [ "$choice" = "y" ]; then
            echo "Running diff"
            diff -r "$dir1" "$dir2"

            # If the command worked, then a message will appear
            if [ $? -eq 0 ]; then
                echo "Complete!"
            fi
        # This appears when the diff command isn't chosen
        else
            echo "Skipped"
        fi
    # This appears only when the rsync command fails
    else
        echo "The command 'rsync' failed!"
    fi
elif [ "$choice" = "del" ]; then
    echo "Running rsync -av --delete"
    rsync -av --delete "$dir1" "$dir2"

    # If the command worked, then a message will appear
    if [ $? -eq 0 ]; then
        echo "Complete!"

        # An extra command may be run if desired, which looks for differences in both directories
        # making sure they are identical, if not, showing where are the differences or simply show
        # what content has in one directory that isn't present in the other one
        read -p "Do you want to extra run a diff command to show directories differences? (y/n): " choice
        if [ "$choice" = "y" ]; then
            echo "Running diff"
            diff -r "$dir1" "$dir2"

            # If the command worked, then a message will appear
            if [ $? -eq 0 ]; then
                echo "Complete!"
            fi
        # This appears when the diff command isn't chosen
        else
            echo "Skipped"
        fi
    # This appears only when the rsync command fails
    else
        echo "The command 'rsync' failed!"
    fi
else
    echo "Invalid choice. Please choose 'updt' or 'del'."
fi
