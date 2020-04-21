#!/bin/sh

echo "***** Start script mlat install ******"
echo 3

#Install mlat-client
sudo apt-get install git build-essential debhelper python3-dev -y


cd ~
git clone https://github.com/mutability/mlat-client.git
cd mlat-client
git checkout v0.2.5

. /etc/os-release
if [ "$VERSION_ID" = "10" ]; then
    echo "Buster detected, fixing cx_Freeze"
    sudo apt-get install  tcl8.6-dev autoconf python3-venv dh-systemd libz-dev -y
    wget 'https://github.com/anthony-tuininga/cx_Freeze/archive/6.0.tar.gz'
    tar -xvf 6.0.tar.gz
    cd cx_Freeze-6.0
    python3 setup.py build
    sudo python3 setup.py install
    cd ~/mlat-client
fi

#dpkg-buildpackage -b -uc
username="$(id -u -n)"
sudo chown $username:$username ~/mlat-client

#sudo dpkg -i ../mlat-client_*.deb
sudo ./setup.py install

echo "copy czadsb starter script"
sudo cp ~/czadsb-scripts/starters/czadsb.mlat-client.sh ~/mlat-client/czadsb.mlat-client.sh
sudo chmod +x ~/mlat-client/czadsb.mlat-client.sh
sudo chown $username:$username ~/mlat-client/czadsb.mlat-client.sh

echo "***** End script mlat install ******"