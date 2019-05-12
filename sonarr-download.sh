#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
LOGFILE="$HOME/server-scripts/$script_name.log"

episode_path="$sonarr_episodefile_path"
season_path="$(dirname "$episode_path")/"
series_path="$sonarr_series_path"

season_folder="$(basename "$season_path")"
series_folder="$(basename "$series_path")"

TO="media:\"Media/TV Shows/$series_folder/$season_folder\""
rclone_command="$HOME/bin/rclone copy \"$episode_path\" $TO --log-file=$LOGFILE"
shrink_command="dd if=\"$episode_path\" of=\"$episode_path\" bs=1M count=5"


echo "Uploading $episode_path to drive." >> $LOGFILE
eval $rclone_command
echo "Done uploading $episode_path to drive." >> $LOGFILE
echo "Shrinking movie at $episode_path." >> $LOGFILE
eval $shrink_command
echo "Done at $(date "+%d.%m.%Y %T")" >> $LOGFILE
echo "============================" >> $LOGFILE