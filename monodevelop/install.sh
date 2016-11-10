#!/bin/bash

set -e

wget https://download.mono-project.com/monodevelop/monodevelop-6.1.1.15-2.flatpak
flatpak install --user --bundle monodevelop-6.1.1.15-2.flatpak
rm monodevelop-6.1.1.15-2.flatpak

sudo bash -c "cat > /usr/share/applications/monodevelop.desktop << _EOF_
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=flatpak run com.xamarin.MonoDevelop
Name=MonoDevelop
Comment=IDE for c# development
Icon=/home/$USERNAME/.local/share/flatpak/app/com.xamarin.MonoDevelop/x86_64/master/active/files/share/icons/hicolor/scalable/apps/monodevelop.svg
_EOF_"
chmod +x /usr/share/applications/monodevelop.desktop

exit 0
