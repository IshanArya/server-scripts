#!/bin/bash

name="_____ - s_e"
i=1
for media in *.mkv; do
	printf -v episodeNumber "%02d" $i
	eval "mv \"$media\" ./\"$name$episodeNumber.mkv\""
	((i++))
done