#!/bin/bash

set -e

sudo flatpak uninstall com.xamarin.MonoDevelop || :
wget https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/ || :
sudo flatpak install gnome org.freedesktop.Platform 1.4 || :
rm gnome-sdk.gpg

wget https://download.mono-project.com/monodevelop/monodevelop-6.1.1.15-2.flatpak
sudo flatpak install --bundle monodevelop-6.1.1.15-2.flatpak
rm monodevelop-6.1.1.15-2.flatpak

sudo bash -c "cat > /usr/share/applications/monodevelop.desktop << _EOF_
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=flatpak run com.xamarin.MonoDevelop
Name=MonoDevelop
Comment=IDE for c# development
Icon=/var/lib/flatpak/app/com.xamarin.MonoDevelop/current/active/export/share/icons/hicolor/scalable/apps/com.xamarin.MonoDevelop.svg
_EOF_"
sudo chmod +x /usr/share/applications/monodevelop.desktop

exit 0
