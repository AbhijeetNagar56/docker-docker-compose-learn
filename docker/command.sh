docker pull <image_name>
docker run <image_name>
docker build -t <image_name> .
docker run -p <host_port>:<container_port> <image_name>
docker stop <container_name>
docker rm <container_name>
docker container prune -f


docker network create appnet
docker network connect appnet suspicious_gould
docker network connect appnet app_mysql
docker network inspect appnet