# Build command
docker build -t flask-login-app .
# Run command
docker run -p 5000:5000 flask-login-app 
# Exec command
docker exec -it postgres_alt psql -U username -d DBname
# Log command
docker logs flask-login-app
# Inspect command  shows the metadata about the container
docker inspect flask-login-app
# Volume command 
docker volume create pgdata
docker run -v pgdata:/var/lib/postgresql/data postgres:16

# Commands Container
docker pull <image_name
docker build -t <image_name> .
docker run -p <host_port>:<container_port> <image_name>
docker stop <container_name>
docker rm <container_name>
docker container prune -f
# This script builds and runs the Docker containers for both the Flask and Node.js applications, and then stops all running containers.
docker build -t flask-login-app .
docker run -p 5000:5000 flask-login-app
docker build -t node-app .
docker run -p 3000:3000 node-app
docker stop # < container_name > 
docker rm # < container_name >
docker container prune -f
docker stop $(docker ps -q)



# Network command
docker network create mynet
docker run --network=mynet --name flask-app flask-login-app
docker run --network=mynet --name postgres-db postgres:16
docker network create appnet
docker network connect appnet suspicious_gould
docker network connect appnet app_mysql
docker network inspect appnet

# Modes of Network
# 1. Bridge (by default) *single host
docker run -d --name app1 nginx
docker run -d --name app2 alpine sleep 3600
docker network ls
docker inspect app1

# 2. Communication requires IP unless you create a custom bridge: ==
docker network create mynet
docker run -d --name web --network mynet nginx
docker run -d --name db --network mynet postgres:16
docker exec db ping web   # Works by name

# Host Network *single host
docker run -d --network host nginx
# directly run on host machine IP at -p 80 **conflict may occur

# 3. Overlay Network
docker swarm init
docker network create -d overlay my_overlay
docker service create --name web --network my_overlay nginx
docker service create --name api --network my_overlay busybox
# container across different nodes Communicate securely
# important for swarm/ kubernetes clusters
# remove custom network
docker network rm appnet