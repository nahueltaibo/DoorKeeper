#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' #No Color

printf "${GREEN}Installing Door Keeper environment...${NC}"
curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | sudo apt-key add -

printf "\n${GREEN}Configuring uv4l package sources...${NC}"

if grep -Fxq "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" /etc/apt/sources.list
then
  echo "uv4l url already in sources.list" 
else
  sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main\n;' /etc/apt/sources.list
fi

printf "\n${GREEN}Updating and Upgrading the system...${NC}"
sudo apt-get update && apt-get upgrade -y

printf "\n${GREEN}Installing required packages...${NC}"
sudo sudo apt-get install -y \
  uv4l \
  uv4l-raspicam \
  uv4l-raspicam-extras \
  uv4l-server