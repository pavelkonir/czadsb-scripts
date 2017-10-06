#!/bin/sh

echo “***** Start script mlat install ******”
echo 3

#Install mlat-client
sudo apt-get install git build-essential debhelper python3-dev -y

cd ~
git clone https://github.com/mutability/mlat-client.git
cd mlat-client
git checkout v0.2.5

dpkg-buildpackage -b -uc

sudo chown pi:pi ~/mlat-client

sudo dpkg -i ../mlat-client_*.deb

echo “***** End script mlat install ******”