#!/bin/sh

echo "***** Start script modesmixer2 install ******"
sleep 3

mm2Version="20170506"


cd /home/pi/downloads

wget https://czadsb.cz/rx-images/utils/modesmixer2_rpi2-3_$mm2Version.tgz

mkdir /home/pi/modesmixer2
cd /home/pi/modesmixer2
tar -zxvf /home/pi/downloads/modesmixer2_rpi2-3_$mm2Version.tgz

sudo chown pi:pi /home/pi/modesmixer2

rm /home/pi/downloads/modesmixer2_rpi2-3_$mm2Version.tgz

echo "copy czadsb starter script"
cp /home/pi/czadsb-scripts/starters/czadsb.modesmixer.sh /home/pi/modesmixer2/czadsb.modesmixer.sh
sudo chmod +x /home/pi/modesmixer2/czadsb.modesmixer.sh

echo "***** End script modesmixer2 install ******"