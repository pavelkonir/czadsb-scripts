#!/bin/sh

sudo touch /boot/ssh

file="/boot/installed"
file_version="1.0.0"

while ! ping -c 1 -W 1 google.com; do
  echo "Waiting for ping google.comn - network interface might be down..."
  sleep 1
done

if [ ! -f "$file" ]
then

  echo "czadsb installation begin"

  if [ -f "/boot/resized" ]
  then
    if [ ! -f "/etc/armbian-release" ]
    then
      sudo resize2fs /dev/mmcblk0p
      sudo reboot
    fi
    sudo echo "Resized" > "/boot/resized"
  fi

  #Update and upgrade
  sudo apt-get update
  sudo apt-get upgrade -y -f
  sudo apt-get install git dos2unix n2n mc -y

  cd /home/pi
  git clone https://github.com/hosek/czadsb-scripts.git
  sudo chown pi:pi /home/pi/czadsb-scripts

  sudo chmod +x /home/pi/czadsb-scripts/*.sh
  sudo chmod +x /home/pi/czadsb-scripts/**/*.sh

  mkdir /home/pi/downloads
  sudo chown pi:pi /home/pi/downloads
  cd /home/pi/downloads

  /home/pi/czadsb-scripts/piaware_install.sh

  /home/pi/czadsb-scripts/mlat_install.sh

  /home/pi/czadsb-scripts/mm2_install.sh

  if [ -f "/etc/armbian-release" ]
  then
    /home/pi/czadsb-scripts/orange_specific.sh
  fi

  echo "copy n2n starter script"
  mkdir /home/pi/n2n
  sudo cp /home/pi/czadsb-scripts/starters/czadsb.n2n.sh /home/pi/n2n/czadsb.n2n.sh
  sudo chmod +x /home/pi/n2n/czadsb.n2n.sh
  sudo chown pi:pi /home/pi/n2n/czadsb.n2n.sh

  echo "copy configs"
  sudo cp /home/pi/czadsb-scripts/configs/czadsb-config.txt /boot/

  /home/pi/czadsb-scripts/starters/autostart.sh

  /home/pi/czadsb-scripts/addons/*.sh

  echo $file_version > $file


  #/boot/czadsb-boot.sh > /home/pi/boot-log.txt
  sudo sed -i '/^\/boot/d' /etc/rc.local

  echo "CZADSB tools installed."
  echo "Please edit /boot/czadsb-config.txt file"

else
    cd /home/pi/czadsb-scripts
    git pull origin
    /home/pi/czadsb-scripts/upgrade.sh
fi





