FROM python:latest

LABEL description Robot Framework in Docker with Additional Libaries.
LABEL Marcin Koperski


ENV ROBOT_HOME /opt/robot
RUN mkdir $ROBOT_HOME

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


## system upgrade
RUN apt-get update && apt-get upgrade -yqq \
    && rm -rf /var/lib/apt/lists/*

#==============================
# imagemagick
#==============================
RUN apt-get update &&  apt-get install -yqq \
    imagemagick \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

#==============================
# python
#==============================
RUN apt-get update &&  apt-get install -yqq \
    git-core \
    python3 \
    python3-tk \
    python3-pip \
    libgtk2.0-dev libgtk-3-dev \
	libjpeg-dev libtiff-dev \
	libsdl1.2-dev libgstreamer-plugins-base0.10-dev \
	libnotify-dev freeglut3 freeglut3-dev libsm-dev \
	libwebkitgtk-dev libwebkitgtk-3.0-dev \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --upgrade pip setuptools wheel 
#========================
# python dependencies
#========================

RUN python -m pip install -U -r https://raw.githubusercontent.com/IlfirinPL/robot-install/master/data/packages.txt
RUN python -m pip install -U git+https://github.com/IlfirinPL/robotframework-MarcinKoperski.git

RUN python --version
RUN robot --version || true


