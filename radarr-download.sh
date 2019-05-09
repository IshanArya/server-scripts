#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
LOGFILE="$HOME/server-scripts/$script_name.log"
movie_folder_path="$radarr_movie_path"
movie_parent_folder="$(basename "$movie_folder_path")"
TO="media:\"Media/Movies/$movie_parent_folder\""
rclone_command="$HOME/bin/rclone copy \"$movie_folder_path\" $TO --log-file=$LOGFILE"


echo "Uploading $movie_parent_folder to drive." >> $LOGFILE
eval $rclone_command
echo "Done uploading $movie_parent_folder to drive." >> $LOGFILE