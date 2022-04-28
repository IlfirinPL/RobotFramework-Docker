FROM python:latest

LABEL description Robot Framework in Docker with Additional Libaries.
LABEL Marcin Koperski


ENV ROBOT_HOME /opt/robot
RUN mkdir $ROBOT_HOME

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN ln -s /bin/bash /usr/bin/bash
#==============================
# imagemagick
#==============================
RUN apt-get update &&  apt-get install -yqq \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

#==============================
# python
#==============================
RUN apt-get update &&  apt-get install -yqq \
    zip \
    unzip \
    git-core \
    libgtk-3-dev libjpeg-dev libtiff-dev \
    libsdl2-dev libgstreamer-plugins-base1.0-dev libnotify-dev \
    libsm-dev libwebkit2gtk-4.0-dev libxtst-dev \
    libgl1-mesa-dev libglu1-mesa-dev \
    build-essential \
    unixodbc unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

RUN python --version
RUN python -m pip install --upgrade pip setuptools wheel 
RUN pip --version
#========================
# python dependencies
#========================
RUN pip install -U -r https://raw.githubusercontent.com/IlfirinPL/robot-install/master/data/packages.txt
RUN pip install -U git+https://github.com/IlfirinPL/robotframework-MarcinKoperski.git


RUN robot --version || true


