# Docker Hub login
docker login -u <username> -p <password>
docker pull <image_name>
docker tag <username>/<image_name>:<tag> <username>/<image_name>:latest
docker push <username>/<image_name>:latest

# GHCR login
docker login ghcr.io -u USERNAME -p TOKEN
docker tag myapp ghcr.io/USERNAME/myapp:1.0
docker build . -t ghcr.io/username/myapp:latest
docker push ghcr.io/USERNAME/myapp:1.0

docker logout