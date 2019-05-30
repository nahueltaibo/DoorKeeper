#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' #No Color

printf "${GREEN}Installing Door Keeper environment...${NC}\n"
curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | sudo apt-key add -

printf "\n${GREEN}Configuring uv4l package sources...${NC}\n"

if grep -Fxq "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" /etc/apt/sources.list
then
  echo "uv4l url already in sources.list" 
else
  sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main\n;' /etc/apt/sources.list
fi

printf "\n${GREEN}Updating and Upgrading the system...${NC}\n"
sudo apt-get update && apt-get upgrade -y

printf "\n${GREEN}Installing required packages...${NC}\n"
sudo sudo apt-get install -y \
  uv4l \
  uv4l-raspicam \
  #uv4l-raspicam-extras \
  uv4l-server

printf "\n${GREEN}Use this command to start the server: ${NC}\n"
printf "${GREEN}$ uv4l --auto-video_nr --driver raspicam --encoding h264 --width 640 --height 480 --framerate 15${NC}\n"

printf "\n${GREEN}After starting the server, you can watch the stream from chrome at:${NC}\n"
printf "${GREEN}http://raspberrypi:8080//stream/video.h264${NC}\n"
printf "${GREEN}http://raspberrypi:8080//stream/video.mjpeg${NC}\n"
printf "${GREEN}http://raspberrypi:8080//stream/video.jpeg${NC}\n"

printf "\n${GREEN}Use this command to stop the server: ${NC}\n"
printf "${GREEN}$ sudo pkill uv4l${NC}\n"
