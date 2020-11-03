# Docker images
This repository contains many Dockerfiles consist of various tools ans software.  
Choose the one which is the best for you.

YouTube video: https://youtu.be/fWrs0syHYp4

## Java-Node-Chrome
1. ``docker login``
2. ``docker build -t my-docker-image-ubuntu18-java8-node10-chrome80:1 -f docker-java8-node10-chrome80.dockerfile .``

## Common Docker commands
- docker image ls
- docker ps -a
- docker rmi < IMAGE ID >
- docker container rm < CONTAINER ID >
- docker run -dit --name=mycontainer < IMAGE ID >
- docker start
- docker exec -it < CONTAINER_NAME /ID > /bin/bash
