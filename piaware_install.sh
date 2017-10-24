#!/bin/sh

piawareDeb="piaware-repository_3.5.1_all.deb"

echo "***** Start script piaware install ******"

sleep 3

# Add piaware source
wget http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/$piawareDeb
sudo dpkg -i $piawareDeb

#Install piaware
sudo apt-get update
sudo apt-get install piaware piaware-web dump1090-fa rtl-sdr -y

if [ ! -f "/etc/armbian-release" ]
    then
      sudo apt-get install piaware-support -y
      sudo sed -i -e '1i\ctrl_interface=/var/run/wpa_supplicant' /etc/wpa_supplicant/wpa_supplicant.conf
    fi

echo "***** End script piaware install ******"
