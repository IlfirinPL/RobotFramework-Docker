# RobotFramework-Docker
Docker Image for automated setup of RobotFramework Tests




There is required  in folder with <local path to the test suites' folder> file "argfile.txt" to pass additional arguments

expected use 
docker run -v <local path to the output files like report screenshots' folder>:/opt/robotframework/output:Z\
    -v <local path to the test suites' folder>:/opt/robotframework/tests:Z\
    mkoperski/robotframework:latest

example use with connection to chrome browser



docker run -d --name standalone-chrome -P selenium/standalone-chrome

docker run \ 
    -v z:/in:/opt/robotframework/tests:Z\
    -v z:/out:/opt/robotframework/output:Z\
    --link standalone-chrome \
    mkoperski/robotframework:latest
`