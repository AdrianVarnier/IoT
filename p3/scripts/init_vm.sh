#!/bin/sh

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install curl git zsh code
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ssh-keygen -N ""