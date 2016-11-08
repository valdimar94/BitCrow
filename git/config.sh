#!/bin/bash

set -e

install="invalid"
echo "Would you like to install git (y/n)?"
until [ \( "$install" == "y" \) -o \( "$install" == "n" \) ]
  do
    read install
done
echo "$install" > $(dirname $0)/install.config

if [ "$install" == "n" ]
  then
    exit 0
fi

echo "What is your git account's email address?"
read email
echo "$email" > $(dirname $0)/email.config

echo "What is your name?"
read name
echo "$name" > $(dirname $0)/name.config

exit 0
