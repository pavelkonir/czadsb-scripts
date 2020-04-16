#!/bin/sh

echo "***** Start script modesmixer2 install ******"
sleep 3

username="$(id -u -n)"

mkdir ~/modesmixer2
cd ~/downloads

wget http://freedom.dicea.unifi.it/debian/pool/main/o/openssl/libssl1.0.0_1.0.2l-1~bpo8+1_armhf.deb
sudo dpkg -i libssl1.0.0_1.0.2l-1~bpo8+1_armhf.deb

# Use device specific MM2 - 32bit on RPI or Orange H5 64bit, there are no other choices http://xdeco.org/?page_id=30
if cat /proc/device-tree/model | grep -q 'Raspberry'; then
   mm2Version="20170506"
   wget https://czadsb.cz/rx-images/utils/modesmixer2_rpi2-3_$mm2Version.tgz
   cd ~/modesmixer2
   tar -zxvf ~/downloads/modesmixer2_rpi2-3_$mm2Version.tgz
elif [ `getconf LONG_BIT` = "64" ]; then
    echo "64 bit system detected, using AllWinner H5 64bit version" 
    cd ~/modesmixer2
    wget https://github.com/pavelkonir/czadsb-scripts/raw/master/modesmixer2
else
    echo "Your platform is probably not supported by MM2" 
    return
fi

cd ~/modesmixer2

sudo chmod +x modesmixer2
sudo chown $username:$username ~/modesmixer2

echo "copy czadsb starter script"
sudo cp ~/czadsb-scripts/starters/czadsb.modesmixer.sh ~/modesmixer2/czadsb.modesmixer.sh
sudo chmod +x ~/modesmixer2/czadsb.modesmixer.sh
sudo chown $username:$username ~/modesmixer2/czadsb.modesmixer.sh

echo "***** End script modesmixer2 install ******"
