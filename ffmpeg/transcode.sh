#!/bin/bash
# Example: Transcode a stream to 720p and 480p for adaptive streaming

INPUT=$1
STREAM_NAME=$2

ffmpeg -i $INPUT \
    -c:v libx264 -b:v 2500k -s 1280x720 -c:a aac -strict -2 /hls/${STREAM_NAME}_720p.m3u8 \
    -c:v libx264 -b:v 1000k -s 854x480 -c:a aac -strict -2 /hls/${STREAM_NAME}_480p.m3u8
