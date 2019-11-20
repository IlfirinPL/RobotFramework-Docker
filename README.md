# RobotFramework-Docker

Docker Image for automated RobotFramework Tests as jenkins, bamboo etc. as docker agent
  https://hub.docker.com/r/mkoperski/robotframework

download image 
```
docker pull mkoperski/robotframework
```

example use manual 
docker run -w /opt/robot -v <path to your code>:/opt/robot mkoperski/robotframework:latest bash
