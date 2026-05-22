#!/bin/bash

# This script builds and runs the Docker containers for both the Flask and Node.js applications, and then stops all running containers.
docker build -t flask-login-app .
docker run -p 5000:5000 flask-login-app
docker build -t node-app .
docker run -p 3000:3000 node-app

docker stop # < container_name > 
docker rm # < container_name >
docker container prune -f
docker stop $(docker ps -q)