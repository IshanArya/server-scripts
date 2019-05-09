#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
movie_folder_path="~/Files/Movies/Iron Man (2007)/"
movie_parent_folder="$(basename "$movie_folder_path")"
TO=$"media:\"Media/Movies/$movie_parent_folder\""
LOGFILE="$HOME/projects/server-scripts/$script_name.log"


echo "Uploading $movie_parent_folder to drive." >> $LOGFILE
echo "Rcloning from $movie_folder_path to $TO." >> $LOGFILE
echo "Done uploading $movie_parent_folder to drive." >> $LOGFILE