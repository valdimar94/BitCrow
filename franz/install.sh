#!/bin/bash

set -e

sudo rm -rf /opt/franz
sudo mkdir -p /opt/franz
wget -qO- https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz | sudo tar xvz -C /opt/franz/

sudo bash -c "cat > /usr/share/applications/franz.desktop << _EOF_
[Desktop Entry]
Name=Franz
Comment=Combine all your messaging services.
Exec=/opt/franz/Franz
Icon=/opt/franz/resources/app.asar.unpacked/assets/franz.svg
Terminal=false
Type=Application
Categories=Messaging
_EOF_"
sudo chmod +x /usr/share/applications/franz.desktop

exit 0
