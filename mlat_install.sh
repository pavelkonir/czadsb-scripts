#!/bin/sh

echo "***** Start script mlat install ******"
echo 3

#Install mlat-client
sudo apt-get install git build-essential debhelper python3-dev -y

cd /home/pi
git clone https://github.com/mutability/mlat-client.git
cd mlat-client
git checkout v0.2.5

dpkg-buildpackage -b -uc

sudo chown pi:pi /home/pi/mlat-client

sudo dpkg -i ../mlat-client_*.deb

echo "copy czadsb starter script"
sudo cp /home/pi/czadsb-scripts/starters/czadsb.mlat-client.sh /home/pi/mlat-client/czadsb.mlat-client.sh
sudo chmod +x /home/pi/mlat-client/czadsb.mlat-client.sh
sudo chown pi:pi /home/pi/mlat-client/czadsb.mlat-client.sh

echo "***** End script mlat install ******"