#!/bin/bash

echo "Insalling Door Keeper environment.."

echo "text here" >> filename
curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | sudo apt-key add -

if grep -q "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main" "$File"; == 1 then
  sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main\n;' /etc/apt/sources.list
fi