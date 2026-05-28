# Docker Learning & Projects

This repository documents my journey mastering **Docker**, featuring practical projects, configuration examples, and essential command references.

## 📂 Applications
Learn how to build Docker images for three distinct application types using **Dockerfile**:
- **Flask**: Python backend
- **Nginx**: Static frontend server
- **Node.js**: JavaScript backend application

## 🐳 Docker Compose
Explore advanced orchestration with `.yaml` configurations covering:
1. **Basic setup**
2. **Health checks**
3. **Restart policies**
4. **Service dependencies** (order)
5. **User and file permissions** management

## 🛠️ Core Concepts & Registry
A quick reference for essential Docker commands:
- **Container Management**: `run`, `build`, `stop`, `exec`, `rm`, `ls`
- **Networking**: Creating and managing networks
- **Registry**: Logging in to **Docker Hub** or **GitHub Container Registry (ghcr)**

## 🚀 Installation
Get started with Docker on your local machine:
```bash
# Ubuntu/Debian
sudo apt install docker.io util-linux-extras

# Arch Linux
sudo pacman -S docker
```
## 🏗️ Project: 3-Tier Application
A complete 3-tier architecture example demonstrating how to dockerize a full stack:

1. Frontend: Nginx
2. Backend: Node.js
3. Database: MySQL

### Implementation Steps
- Create individual Dockerfiles for each service.
- Spin up containers for each image.
- Connect all services via a single custom network.
- Alternative: Manage the entire stack using a docker-compose.yaml file.
