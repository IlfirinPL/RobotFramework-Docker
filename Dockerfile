FROM ubuntu:latest

MAINTAINER Marcin Koperski
LABEL description Robot Framework in Docker with Additional Libaries.

#==============================
# imagemagick
#==============================
RUN apt-get update &&  apt-get install -yqq \
	imagemagick \
	&& rm -rf /var/lib/apt/lists/*


#==============================
# xvfb
#==============================
RUN apt-get update &&  apt-get install -yqq \
	xvfb \
	&& rm -rf /var/lib/apt/lists/*

#==============================
# python
#==============================
RUN apt-get update &&  apt-get install -yqq \
	python \
	python-pip \
	python-dev \
	build-essential \
	python-tk \
	&& rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
#========================
# python dependencies
#========================
WORKDIR /opt/robotframework/

COPY requirements.txt ./

RUN pip install --upgrade --no-cache-dir -r requirements.txt

RUN pip install --upgrade --no-cache-dir -U robotframework-MarcinKoperski>=0.0.41

#========================
# mount test cases and test results folders aka "outputDir"
#========================

VOLUME /opt/robotframework/output
VOLUME /opt/robotframework/tests



ENV PATH=/opt/robotframework/bin:/opt/robotframework/drivers:$PATH

WORKDIR /opt/robotframework/tests


# for remote monitroing when proper arguments are set later for debug image
#EXPOSE 3306


ENTRYPOINT ["robot", "--outputDir", "/opt/robotframework/output","--argumentfile","/opt/robotframework/tests/argfile.txt", "/opt/robotframework/tests"]

