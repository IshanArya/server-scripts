#!/bin/sh

script_name=$(basename -- "$0" | cut -f 1 -d '.')
LOGFILE="$HOME/server-scripts/$script_name.log"
series_path="$sonarr_series_path"
episode_path="$sonarr_episodefile_path"
episode_source_path="$sonarr_episodefile_sourcepath"
episode_source_folder_path="$sonarr_episodefile_sourcefolder"
# TO="media:\"Media/TV Shows/$movie_parent_folder\""
# rclone_command="$HOME/bin/rclone copy \"$movie_folder_path\" $TO --log-file=$LOGFILE"

echo "Series Path: $series_path" >> $LOGFILE
echo "Episode Path: $episode_path" >> $LOGFILE
echo "Done at $(date "+%d.%m.%Y %T")" >> $LOGFILE