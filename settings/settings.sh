#!/bin/bash

set -e

echo "Would you like remove ubuntu amazon launcher(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo rm -rf /usr/share/applications/ubuntu-amazon-default.desktop
fi

echo "Would you like remove UXTerm launcher(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo rm -rf /usr/share/applications/debian-uxterm.desktop
fi

echo "Would you like remove XTerm launcher(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo rm -rf /usr/share/applications/debian-xterm.desktop
fi

echo "Would you like uninstall firefox(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove firefox
fi

echo "Would you like uninstall thunderbird(y/n)?"
read answer
if [ "$answer" == "y" ]
  then
    sudo apt-get -y remove thunderbird
fi

echo "Would you like uninstall libreoffice(y/n)?"
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
