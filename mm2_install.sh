#!/bin/sh

echo "***** Start script modesmixer2 install ******"
sleep 3

mm2Version="20170506"


cd /home/pi/downloads

wget http://freedom.dicea.unifi.it/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8+1_armhf.deb
sudo dpkg -i libssl1.0.0_1.0.2l-1~bpo8+1_armhf.deb

mkdir /home/pi/modesmixer2
cd /home/pi/modesmixer2
wget https://github.com/hosek/czadsb-scripts/raw/master/modesmixer2
sudo chmod +x modesmixer2
sudo chown pi:pi /home/pi/modesmixer2

echo "copy czadsb starter script"
sudo cp /home/pi/czadsb-scripts/starters/czadsb.modesmixer.sh /home/pi/modesmixer2/czadsb.modesmixer.sh
sudo chmod +x /home/pi/modesmixer2/czadsb.modesmixer.sh
sudo chown pi:pi /home/pi/modesmixer2/czadsb.modesmixer.sh

echo "***** End script modesmixer2 install ******"
