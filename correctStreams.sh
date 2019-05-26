#!/bin/bash

i=0
for media in *.mkv; do
	ffmpeg -i $media
	read -p "Streams you wish to keep: " stream1 stream2 stream3 stream4
	read -p "Name of new file: " NAME
	commands[i]="ffmpeg -i $media -map $stream1 -map $stream2 -map $stream3 -map $stream4 -c copy $NAME"
	((i++))
done

for command in "${commands[@]}"; do
	echo "$command"
	eval "$command"
done