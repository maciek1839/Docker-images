# Build command: docker build -t my-docker-image-ubuntu18-java8-node10-chrome80:1 -f docker-java8-node10-chrome80.dockerfile .
# Before building an image, log in because ubuntu registry requires it (command: docker login).

FROM ubuntu:18.04

# Install common tools
# IF YOU WANT TO DECREASE IMAGE'S SIZE, REMOVE THE UNNECESSARY TOOLS FROM THIS COMMAND
# Use a backslash (\), if you want to break up a command to more than one line.
# The command "rm -rf /var/lib/apt/lists/*" removes redundant files from a given layer
RUN apt-get update \
    && apt-get -y install curl \
    && apt-get -y install git \	
    && apt-get -y install wget \	
    && apt-get -y install net-tools \
    && apt-get -y install zip \
    && rm -rf /var/lib/apt/lists/*

# Install packages required by Chrome.
# If you want to install a newer Chrome version which requires a few more packages (but you don't know which), you will see the proper output.
RUN apt-get update && apt-get install -y lsb-release libgtk-3-0 libappindicator3-1 xdg-utils libxss1 libnss3 libnspr4 libasound2 libappindicator1 fonts-liberation libgconf2-4 libxss1 xdg-utils libasound2
	
# Install Chrome v80.0.3987.122-1
RUN wget https://github.com/webnicer/chrome-downloads/raw/master/x64.deb/google-chrome-stable_80.0.3987.122-1_amd64.deb \
 && dpkg -i google-chrome*.deb \
 && google-chrome --version
	
# Install Java8
# If you want to include higher Java version from a particular vendor, 
# use a image including that Java version as your base image instead of Ubuntu. 
RUN apt-get -y install openjdk-8-jdk \
    && java -version \
    && rm -rf /var/lib/apt/lists/*

# Install node
# https://joshtronic.com/2018/05/08/how-to-install-nodejs-10-on-ubuntu-1804-lts/
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get -y install nodejs \
    && node -v

# https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425
# The set -o pipefail - this setting prevents errors in a pipeline from being masked.
SHELL ["/bin/bash", "-o", "pipefail"]

# Here you can add your own application files, define CMD or ENTRYPOINT, expose ports and so on...
#
# 

# Image specification
# node 10.X
# Java 8
# Chrome 80
# tools: git, curl, wget, net-tools, zip