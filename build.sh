#!/usr/bin/env bash

DOCKER_NAME=district-deployment-test

docker build -t ${DOCKER_NAME} .
docker run --name ${DOCKER_NAME} -p 2991:80 ${1} -d ${DOCKER_NAME}
docker container ls -a
