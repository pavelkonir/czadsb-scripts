#!/bin/sh


echo "***** Start script piaware install ******"

sleep 3
echo "***** Preparing to build dump1090-fa ******"
#Prepare for building
sudo apt-get update
sudo apt install git lighttpd debhelper librtlsdr-dev pkg-config dh-systemd libncurses5-dev libbladerf-dev libusb-1.0-0-dev python -y

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
sudo apt-get install piaware piaware-web rtl-sdr -y

if [ ! -f "/etc/armbian-release" ]
    then
      sudo apt-get install piaware-support -y
    fi

echo "***** End script piaware install ******"
