#!/bin/bash

set -e

echo "Would you like remove ubuntu amazon(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo rm /usr/share/applications/ubuntu-amazon-default.desktop
fi

echo "Would you like remove firefox(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove firefox
fi

echo "Would you like remove libreoffice(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove libreoffice*
fi

unity-control-center display
unity-control-center power
unity-control-center screen
unity-control-center sound
software-properties-gtk --open-tab=4

exit 0
