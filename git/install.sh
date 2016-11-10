#!/bin/bash

set -e

sudo apt-get -y install git

email=$(cat $(dirname $0)/email.config)
name=$(cat $(dirname $0)/name.config)

git config --global user.email "$email"
git config --global user.name "$name"

if [ ! -f ~/.ssh/id_rsa ]
  then
    ssh-keygen -t rsa -b 4096 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    sensible-browser https://github.com/settings/keys
    gedit ~/.ssh/id_rsa.pub
fi

installgitlfs=$(cat $(dirname $0)/installgitlfs.config)
if [ $installgitlfs == "y" ]
  then
    wget https://github.com/github/git-lfs/releases/download/v1.4.4/git-lfs-linux-amd64-1.4.4.tar.gz
    tar -zxvf git-lfs-linux-amd64-1.4.4.tar.gz
    rm git-lfs-linux-amd64-1.4.4.tar.gz
    chmod +x git-lfs-1.4.4/install.sh
    cd git-lfs-1.4.4 && sudo ./install.sh
    rm -rf git-lfs-1.4.4
    sudo git lfs install
fi

exit 0
