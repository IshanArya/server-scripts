#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
movie_folder_path="$radarr_movie_path"
movie_parent_folder="$(basename "$movie_folder_path")"
TO=$"media:\"Media/Movies/$movie_parent_folder\""
LOGFILE="~/server-scripts/$script_name.log"


echo "Uploading $movie_parent_folder to drive." >> $LOGFILE
rclone copy "$movie_folder_path" $TO --log-file=$LOGFILE
echo "Done uploading $movie_parent_folder to drive." >> $LOGFILE