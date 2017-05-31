FROM ubuntu:latest

MAINTAINER Marcin Koperski
LABEL description Robot Framework in Docker with Additional Libaries.

#========================
# mount test cases and test results folders
#========================

VOLUME /opt/robotframework/reports
VOLUME /opt/robotframework/tests

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
	&& rm -rf /var/lib/apt/lists/* 

	
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
#========================
# python dependencies
#========================
WORKDIR /opt/robotframework/

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --no-cache-dir -U robotframework-MarcinKoperski>=0.0.41


COPY . .


	
WORKDIR /opt/robotframework/tests


ENV PATH=/opt/robotframework/bin:/opt/robotframework/drivers:$PATH

CMD ["robot", "--outputDir", "/opt/robotframework/reports", "/opt/robotframework/tests"]
