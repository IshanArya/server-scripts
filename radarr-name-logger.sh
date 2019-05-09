#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
LOGFILE="$HOME/server-scripts/$script_name.log"
movie_folder_path="$radarr_movie_path"
movie_parent_folder="$(basename "$movie_folder_path")"
TO="media:\"Media/Movies/$movie_parent_folder\""
rclone_command="$HOME/bin/rclone copy \"$movie_folder_path\" $TO --log-file=$LOGFILE"

echo "Movie Folder Path: $movie_folder_path" >> $LOGFILE
echo "Movie Parent Folder: $movie_parent_folder" >> $LOGFILE
echo "To: $TO" >> $LOGFILE
echo "Script: $rclone_command" >> $LOGFILE