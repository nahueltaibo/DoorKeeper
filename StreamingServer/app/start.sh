#!/bin/bash

source ./set_option.sh

CONF_FILE=${CONF_DIR}uv4l.conf

# Start UV4L
uv4l --driver raspicam --auto-video_nr --width 640 --height 480 --encoding jpeg
