FROM ubuntu:latest

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
    python \
    python-tk \
    python-pip \
    git-core \
    python3 \
    python3-tk \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN alias pip='python3 -m pip'

RUN python3 -m pip install --upgrade pip setuptools wheel 
#========================
# python dependencies
#========================

RUN python3 -m pip install -U -r https://raw.githubusercontent.com/IlfirinPL/robotframework-MarcinKoperski/master/requirements.txt
RUN python3 -m pip install -U git+https://github.com/IlfirinPL/robotframework-MarcinKoperski.git


#ENTRYPOINT ["robot", "--outputDir", "$ROBOT_HOME/output","--argumentfile","$ROBOT_HOME/tests/argfile.txt", "$ROBOT_HOME/tests"]

