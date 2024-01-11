# Simple rsync script

Don't expect it to be something else, but simple.

## simple-rsync-script

Is a really simple shell script which allows you to run the following commands by opt: 'rsync -av --delete "$dir1" "$dir2"' or 'rsync -av --update "$dir1" "$dir2"', where dir1 is the source directory and dir2 is the directory to receive changes.

After the command successful, you are presented with another option to run: 'diff -R "$dir1" "$dir2"'.

## rsync-delete

Is the script containing only the 'rsync -av --delete "$dir1" "$dir2"' command.

Allows you to create a identical replica of the directory source, deleting everything in a folder that isn't in the source and updating all the older files

## rsync-update

Is the script containing only the rsync -av --update "$dir1" "$dir2"' command.

Allows you to only update all the files, adding the ones that are missing and updating the oens that are old.

## Required dependencies:
- rsync

## Usage:
Run the script, and give the directories path. The script must be executable

Example:
``./simple-rsync-script path/to/directory path/to/directory``
