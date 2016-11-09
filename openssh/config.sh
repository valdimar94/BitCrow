#!/bin/bash

set -e

install="invalid"
echo "Would you like to install openssh (y/n)?"
until [ \( "$install" == "y" \) -o \( "$install" == "n" \) ]
  do
    read install
done
echo "$install" > $(dirname $0)/install.config

if [ "$install" == "n" ]
  then
    exit 0
fi

echo "Pick a port for OpenSSH?"
read port
echo "$port" > $(dirname $0)/port.config

exit 0
