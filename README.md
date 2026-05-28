# Docker Learning
This repo is for my docker projects and learning assignments.<br>
This includes commands for docker images, container and registry.


## Apps
Making images for three applications using **Dockerfile**.
1. flask (python backend)
2. nginx (frontend static file)
3. node (node js backend application)

## Compose
Includes commands for .yaml file with
1. basic
2. health checks
3. restart policy
4. order (dependency)
5. user and file permissions management

## docker and dockerHub
container, image run build stop exec rm ls network.<br>
container registry login to dockerHub or ghcr

## Installation commands
```
sudo apt install docker.io util-linux-extras # pacman -S for linux
```

## Project
3tier application dockerize
1. frontend: nginx
2. backend: nodejs
3. database: mysql<br>
creating image from dockerfile for each.<br>
creating each image's container.<br>
creating one network and connecting all containers in same network.<br>
**Alternate is using compose.yaml**
