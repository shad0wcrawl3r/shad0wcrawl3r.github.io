#!/bin/bash

divider(){
  echo "-----------------------------------------------------------------------"
}



divider
echo "Updating the apt repository."
divider
apt update

divider
echo "Installing  packages required for docker."
divider
apt install -y git apt-transport-https ca-certificates curl gnupg lsb-release
divider
echo "Adding the GPG key for docker."
divider
#curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
cat /usr/share/keyrings/docker-archive-keyring.gpg > /dev/null || curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

divider
echo "Adding the source file for docker"
divider
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
divider
echo "Update apt repository"
divider
apt update
divider
echo "Installing docker and python"
divider
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
echo "alias docker-compose='docker compose'" >> /root/.bashrc
