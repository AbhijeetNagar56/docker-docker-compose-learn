docker login ghcr.io -u USERNAME -p TOKEN
docker tag myapp ghcr.io/USERNAME/myapp:1.0
docker push ghcr.io/USERNAME/myapp:1.0
