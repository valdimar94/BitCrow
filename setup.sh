#!/bin/bash

set -e

if [ "$#" -ne 1 ]
  then
    echo "Illegal number of parameters"
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
   echo "This script must not run as root" 1>&2
   exit 1
fi

sudo echo "Starting Script!"

if [ \( "$1" == "config" \) -o \( "$1" == "all" \) ]
  then
    chmod +x $(dirname $0)/git/config.sh
    ./$(dirname $0)/git/config.sh
fi

if [ \( "$1" == "install" \) -o \( "$1" == "all" \) ]
  then
    chmod +x $(dirname $0)/git/install.sh
    ./$(dirname $0)/git/install.sh
fi

exit 0
