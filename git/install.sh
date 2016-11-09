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
    gedit ~/.ssh/id_rsa.pub
fi

exit 0
