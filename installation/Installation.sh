sudo apt install docker.io util-linux-extra -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
# check
sudo systemctl status docker
docker run hello-world