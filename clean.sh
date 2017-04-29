#!/bin/bash
container_id=$(docker ps -q)
docker stop ${container_id}
container_id=$(docker ps -a -q)
docker rm ${container_id}
# images_id=$(docker images -q) 
# docker rmi ${images_id}
