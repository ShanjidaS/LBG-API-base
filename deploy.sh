#!/bin/bash

DOCKERHUB_USER=shanjidas
APP_NAME=lbg-api-ap

docker rmi -f  ${DOCKERHUB_USER}/${APP_NAME}
# build image (missspelling in name)
docker build -t ${DOCKERHUB_USER}/${APP_NAME} .

# push to dockerhub
docker push ${DOCKERHUB_USER}/${APP_NAME}

docker rm -f ${APP_NAME}
# run container from image
docker run -d -p 80:4000 --name ${APP_NAME} ${DOCKERHUB_USER}/${APP_NAME}

docker system prune -f
