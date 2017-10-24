#!/bin/sh

file="/boot/installed"

if [ ! -f "$file" ]
then

  while ! ping -c 1 -W 1 google.com; do
      echo "Waiting for ping google.comn - network interface might be down..."
      sleep 1
  done


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
  sudo apt-get upgrade -y
  sudo apt-get install git

  cd ~
  git clone https://github.com/pavelkonir/czadsb-scripts.git
  sudo chown pi:pi ~/czadsb-scripts

  sudo chmod +x ~/czadsb-scripts/**/*.sh

  mkdir ~/downloads
  sudo chown pi:pi ~/downloads
  cd ~/downloads

  ~/czadsb-scripts/piaware_install.sh

  ~/czadsb-scripts/mlat_install.sh

  ~/czadsb-scripts/mm2_install.sh

  if [ -f "/etc/armbian-release" ]
  then
    ~/czadsb-scripts/orange_specific.sh
  fi

  ~/czadsb-scripts/starters/autostart.sh

  ~/czadsb-scripts/addons/*.sh

  echo "Installed" > $file


  sudo rm -f /etc/init.d/czadsb-boot.sh

fi





