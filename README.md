Docker Image for automated setup of RobotFramework Tests

expected use 

docker run -v <local path to the output files like report screenshots' folder>:/opt/robotframework/reports:Z\
    -v <local path to the test suites' folder>:/opt/robotframework/tests:Z\
    mkoperski/robotframework:latest

# RobotFramework-Docker
