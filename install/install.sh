#!/bin/bash

echo "Insalling Door Keeper environment.."

curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | sudo apt-key add -

if grep -Fxq "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" /etc/apt/sources.list
then
  echo "uv4l url already in sources.list" 
else
  sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main\n;' /etc/apt/sources.list
fi