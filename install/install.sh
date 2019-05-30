#!/bin/bash

echo "Insalling Door Keeper environment.."
curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | sudo apt-key add -

echo " "
echo Configuring uv4l package sources...
if grep -Fxq "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" /etc/apt/sources.list
then
  echo "uv4l url already in sources.list" 
else
  sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main\n;' /etc/apt/sources.list
fi

echo " "
echo Updating and Upgrading the system...
sudo apt-get update && apt-get upgrade -y

echo " "
echo Installing required packages...
sudo sudo apt-get install -y \
  uv4l \
  uv4l-raspicam \
  uv4l-raspicam-extras \
  uv4l-server