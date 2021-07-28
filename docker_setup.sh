#!/bin/bash
echo 'Docker Install'
echo 'ref. https://docs.docker.com/engine/install/'
echo 'Set up the repository: Update the apt package index and install packages to allow apt to use a repository over HTTPS'
sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg \
     lsb-release
echo 'Set up the repository: Add Docker official GPG key'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo 'Install Docker Engine: Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version'
sudo apt-get update
echo 'Install Docker Engine'
sudo apt-get install docker-ce docker-ce-cli containerd.io
