#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
LOGFILE="$HOME/server-scripts/$script_name.log"
movie_file_path="$radarr_moviefile_path"
movie_folder_path="$radarr_movie_path"
movie_parent_folder="$(basename "$movie_folder_path")"
TO="media:\"Media_Write/Movies/$movie_parent_folder\""
rclone_command="$HOME/bin/rclone copy \"$movie_folder_path\" $TO --log-file=$LOGFILE"
shrink_command="dd if=\"$movie_file_path\" of=\"$movie_file_path\" bs=1M count=5"


echo "Uploading $movie_parent_folder to drive." >> $LOGFILE
eval $rclone_command
echo "Done uploading $movie_parent_folder to drive." >> $LOGFILE
echo "Shrinking movie at $movie_file_path." >> $LOGFILE
eval $shrink_command
echo "Done at $(date "+%d.%m.%Y %T")" >> $LOGFILE
echo "============================" >> $LOGFILE
