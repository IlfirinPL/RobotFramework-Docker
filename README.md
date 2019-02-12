# RobotFramework-Docker
Docker Image for automated setup of RobotFramework Tests

There is required  in folder with <local path to the test suites' folder> file "argfile.txt" to pass additional arguments

expected use 
docker run -w /opt/robot -v <local path to the output files like report screenshots' folder>:/opt/robot mkoperski/robotframework:latest bash
