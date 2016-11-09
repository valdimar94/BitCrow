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

file=$(dirname $0)/../$1/configured.config
configured=$([ -f $file ] && cat $file || echo "n")
if [ "$configured" == "y" ]
  then
    echo "$1 is already configured, would you like to reconfigure it (y/n)?"
    read answer
    if [ "$answer" == "n" ]
      then
        exit 0
    fi
fi

chmod +x $(dirname $0)/../$1/config.sh
./$(dirname $0)/../$1/config.sh

echo "y" > $(dirname $0)/../$1/configured.config

exit 0
