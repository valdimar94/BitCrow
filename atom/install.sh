#!/bin/bash

set -e

sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update
sudo apt-get -y install atom

exit 0
