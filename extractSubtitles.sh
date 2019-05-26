#!/bin/bash

i=1
for media in *.mkv; do
	fileName=$(basename "$media" .mkv)
	eval "ffmpeg -i \"$media\" -map 0:s:0 Subs/\"$fileName.eng.srt\""
	((i++))
done