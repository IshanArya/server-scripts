#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
movie_folder_path="$radarr_movie_path"
movie_parent_folder="$(basename "$movie_folder_path")"
TO=$"media:\"Media/Movies/$movie_parent_folder\""


echo "Uploading $movie_parent_folder to drive." >> ~/server-scripts/$script_name.log
rclone copy $movie_folder_path $TO
echo "Done uploading $movie_parent_folder to drive." >> ~/server-scripts/$script_name.log