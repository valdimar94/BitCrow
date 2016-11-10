#!/bin/bash

set -e

if [ "$#" -ne 1 ]
  then
    echo "Illegal number of parameters"
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
   echo "This script must not run as root"
   exit 1
fi

sudo echo "Starting Script!"

chmod +x $(dirname $0)/base/config.sh
chmod +x $(dirname $0)/base/install.sh

if [ \( "$1" == "config" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/base/config.sh atom
    ./$(dirname $0)/base/config.sh chrome
    ./$(dirname $0)/base/config.sh git
    ./$(dirname $0)/base/config.sh openssh
fi

if [ \( "$1" == "install" \) -o \( "$1" == "all" \) ]
  then
    ./$(dirname $0)/base/install.sh atom
    ./$(dirname $0)/base/install.sh chrome
    ./$(dirname $0)/base/install.sh git
    ./$(dirname $0)/base/install.sh openssh
fi

exit 0
