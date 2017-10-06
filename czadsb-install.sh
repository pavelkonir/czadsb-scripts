#!/bin/sh

orange=true

#Update and upgrade
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git

cd ~
git clone https://github.com/pavelkonir/czadsb-scripts.git
sudo chown pi:pi ~/czadsb-scripts

sudo chmod +x ~/czadsb-scripts/*.sh

mkdir ~/downloads
sudo chown pi:pi ~/downloads
cd ~/downloads

~/czadsb-scripts/piaware_install.sh

~/czadsb-scripts/mlat_install.sh

~/czadsb-scripts/mm2_install.sh

if $orange ; then
	~/czadsb-scripts/orange_specific.sh
fi





