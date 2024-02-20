#!/bin/sh


echo "***** Start script piaware install ******"

sleep 3
echo "***** Preparing to build dump1090-fa ******"
#Prepare for building
sudo apt-get update
sudo apt install git lighttpd debhelper libsoapysdr-dev librtlsdr-dev pkg-config libncurses5-dev libbladerf-dev libusb-1.0-0-dev python libhackrf-dev liblimesuite-dev -y

git clone https://github.com/flightaware/dump1090 dump1090-fa 
cd dump1090-fa 
echo "***** Building dump1090-fa ******"
sudo dpkg-buildpackage -b --no-sign
cd ..
echo "***** Installing dump1090-fa ******"
sudo dpkg -i dump1090-fa_*.deb
sudo systemctl enable dump1090-fa.service
sudo service dump1090-fa start

#Install piaware
wget https://www.flightaware.com/adsb/piaware/files/packages/pool/piaware/f/flightaware-apt-repository/flightaware-apt-repository_1.2_all.deb
sudo dpkg -i flightaware-apt-repository_1.2_all.deb
sudo apt-get update
sudo apt-get install piaware piaware-web rtl-sdr -y

if [ ! -f "/etc/armbian-release" ]
    then
      sudo apt-get install piaware-support -y
    fi

echo "***** End script piaware install ******"
