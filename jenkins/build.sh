#!/bin/bash
DOCKER_IMAGE_NAME = 'naveenyash/ny-alpine:latest'


echo $DOCKER_IMAGE_NAME
docker build -t $DOCKER_IMAGE_NAME .
