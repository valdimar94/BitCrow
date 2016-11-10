#!/bin/bash

set -e

sudo add-apt-repository -y ppa:alexlarsson/flatpak
sudo apt -y update
sudo apt -y install flatpak

exit 0
