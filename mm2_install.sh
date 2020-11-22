#!/bin/sh

echo "***** Start script modesmixer2 install ******"
sleep 3

username="$(id -u -n)"

mkdir ~/modesmixer2
cd ~/downloads

wget http://freedom.dicea.unifi.it/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8+1_armhf.deb
sudo dpkg -i libssl1.0.0_1.0.2l-1~bpo8+1_armhf.deb

# Use device specific MM2 - 32bit on RPI or Orange H5 64bit, there are no other choices http://xdeco.org/?page_id=30
if cat /proc/device-tree/model | grep -q 'Raspberry Pi 4'; then
    cp ~/czadsb-scripts/mm2/modesmixer2-rpi4 ~/modesmixer2/modesmixer2
elif cat /proc/device-tree/model | grep -q 'Raspberry Pi Model B+'; then
    cp ~/czadsb-scripts/mm2/modesmixer2-rpi1 ~/modesmixer2/modesmixer2
elif cat /proc/device-tree/model | grep -q 'Raspberry'; then
    cp ~/czadsb-scripts/mm2/modesmixer2-rpi2-3_deb9 ~/modesmixer2/modesmixer2
elif [ `getconf LONG_BIT` = "64" ]; then
    echo "64 bit system detected, using AllWinner H5 64bit version"
    cp ~/czadsb-scripts/modesmixer2-64 ~/modesmixer2/modesmixer2
else
    echo "Unable to found right version of MM2, using default one, its possible that it will not work" 2>&1
    cp ~/czadsb-scripts/mm2/modesmixer2-rpi2-3_deb9 ~/modesmixer2/modesmixer2
fi

cd ~/modesmixer2

sudo chmod +x modesmixer2
sudo chown $username:$username ~/modesmixer2

echo "copy czadsb starter script"
sudo cp ~/czadsb-scripts/starters/czadsb.modesmixer.sh ~/modesmixer2/czadsb.modesmixer.sh
sudo chmod +x ~/modesmixer2/czadsb.modesmixer.sh
sudo chown $username:$username ~/modesmixer2/czadsb.modesmixer.sh

echo "***** End script modesmixer2 install ******"
