#!/bin/bash

echo "Insalling Door Keeper environment.."

echo "text here" >> filename
curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | sudo apt-key add -

sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main\n;' /etc/apt/sources.list

