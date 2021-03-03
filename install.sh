#! /bin/bash
echo "Creating user config directory"
mkdir -p ~/.config/cwgif
cp cwgif.conf ~/.config/cwgif
echo "Copying program, root password required"
sudo cp cwgif.sh /usr/bin/cwgif
