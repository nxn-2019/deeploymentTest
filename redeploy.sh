#!/usr/bin/env bash

DOCKER_NAME=district-deployment-test
CONTAINER_IDS=$(docker container ls -a -q -f name=${DOCKER_NAME})

if [[ "$CONTAINER_IDS" != "" ]]; then
    docker container rm -f ${CONTAINER_IDS} || true
    exit
fi

docker login --username=nxn2021 --password=NXNLogin@2019

docker pull nxn2021/deployment-test:latest
docker system prune -f
#docker run -d --name=${DOCKER_NAME} nxn-2019/deployment-test:latest
docker run --name ${DOCKER_NAME} -p 2331:80 ${1} -d ${DOCKER_NAME} nxn-2019/deployment-test:latest

docker container ls -a