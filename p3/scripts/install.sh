#!/bin/bash

# Update package lists and install essential packages
sudo apt-get update
sudo apt-get install -y git curl apt-transport-https ca-certificates software-properties-common gnupg-agent

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add current user to the docker group to run docker commands without sudo
sudo usermod -aG docker $USER

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install k3d
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# Install agrocd
curl -LO "https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64"
chmod +x "argocd-linux-amd64"
sudo mv "argocd-linux-amd64" /usr/local/bin/argocd
