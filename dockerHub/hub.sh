
docker login -u <username> -p <password>
docker pull <image_name>

docker tag <username>/<image_name>:<tag> <username>/<image_name>:latest
docker push <username>/<image_name>:latest
docker logout