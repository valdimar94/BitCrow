#!/bin/bash

set -e

if [ "$#" -ne 1 ]
  then
    echo "Illegal number of parameters"
    exit 1
fi

install="invalid"
echo "Would you like to install $1 (y/n)?"
until [ \( "$install" == "y" \) -o \( "$install" == "n" \) ]
  do
    read install
done
echo "$install" > $(dirname $0)/../$1/install.config

if [ "$install" != "y" ]
  then
    exit 0
fi

chmod +x $(dirname $0)/../$1/config.sh
./$(dirname $0)/../$1/config.sh

exit 0
