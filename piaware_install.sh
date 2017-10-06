#!/bin/sh

piawareVersion="3.5.1"

echo "***** Start script piaware install ******"

sleep 3

# Add piaware source
wget http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_$piawareVersion_all.deb
sudo dpkg -i piaware-repository_$piawareVersion_all.deb

#Install piaware
sudo apt-get update
sudo apt-get install piaware piaware-web dump1090-fa rtl-sdr -y

echo "***** End script piaware install ******"