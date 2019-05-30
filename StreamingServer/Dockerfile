FROM balenalib/raspberry-pi:latest

# Install the UV4L PPA
RUN curl http://www.linux-projects.org/listing/uv4l_repo/lpkey.asc | sudo apt-key add - &&\
  sed -i '1s;^;deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/stretch stretch main\n;' /etc/apt/sources.list

# Install dependencies as well as the proper version of uv4l-webrtc
RUN apt-get update -q 

RUN apt-get install -yq uv4l
RUN apt-get install -yq uv4l-raspicam
#RUN apt-get install -yq uv4l-raspicam-extras
RUN apt-get install -yq uv4l-server
RUN apt-get install -yq uv4l-webrtc

#RUN apt-get install -yq uv4l-demos
#RUN apt-get install -yq  uv4l-dummy 
#RUN apt-get install -yq uv4l-mjpegstream
#RUN apt-get install -yq uv4l-raspidisp
#RUN apt-get install -yq uv4l-uvc
#RUN apt-get install -yq uv4l-xmpp-bridge
#RUN apt-get install -yq uv4l-xscreen
#RUN apt-get install -yq vlc
RUN apt-get install -yq dos2unix

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install dos2unix so we can convert sh script files to unix format

# Move to app dir
WORKDIR /usr/src/app

# Configure env vars
ENV CONF_DIR=/usr/src/app/config/ \
  INITSYSTEM=on

# Copy over our project files
COPY ./app/ /usr/src/app/
COPY ./config/ /usr/src/app/config/

# Disable uv4l_raspicam service which we'll manually start later
#RUN systemctl disable uv4l_raspicam

# Convert linux file style to linux and remove the tool
RUN dos2unix /usr/src/app/* 

# Remove dos2unix
RUN apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*

# Start app
CMD ["/bin/bash", "/usr/src/app/start.sh"]