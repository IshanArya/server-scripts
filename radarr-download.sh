#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
# movie_path="$radarr_moviefile_path"
# movie_path="~/Files/Download/Iron Man (2007)/Iron Man (2007).mkv"
movie_folder_path="$radarr_movie_path"
movie_parent_folder="$(basename $movie_folder_path)"

# echo $movie_folder_path
# echo $movie_parent_folder

echo "Uploading $movie_parent_folder to drive." >> ~/projects/server-scripts/$script_name.log
# rclone copy $movie_folder_path media:"Media/Movies/$movie_parent_folder"
echo "Done uploading $movie_parent_folder to drive." >> ~/projects/server-scripts/$script_name.log