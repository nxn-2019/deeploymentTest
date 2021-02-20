#!/usr/bin/env bash

DOCKER_NAME=district-deployment-test

docker pull nxn-2019/deployment-test:latest
docker stop ${DOCKER_NAME}
docker system prune -f
#docker run -d --name=${DOCKER_NAME} nxn-2019/deployment-test:latest
docker run --name ${DOCKER_NAME} -p 2331:80 ${1} -d ${DOCKER_NAME} nxn-2019/deployment-test:latest