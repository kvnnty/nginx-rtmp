#!/bin/bash
# Clean up old HLS segments older than 24h
find /hls -type f -mtime +1 -exec rm -f {} \;
find /vod -type f -mtime +7 -exec rm -f {} \;
