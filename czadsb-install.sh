#!/bin/sh

sudo touch /boot/ssh

file="/boot/installed"
file_version="1.0.1"

while ! ping -c 1 -W 1 google.com; do
  echo "Waiting for ping google.comn - network interface might be down..."
  sleep 1
done

if [ ! -f "$file" ]
then

  echo "czadsb installation begin"

  # if [ -f "/boot/resized" ]
  # then
  #   if [ ! -f "/etc/armbian-release" ]
  #   then
  #     sudo resize2fs /dev/mmcblk0p
  #     sudo reboot
  #   fi
  #   sudo echo "Resized" > "/boot/resized"
  # fi

  #Update and upgrade
  sudo apt-get update
  sudo apt-get upgrade -y -f
  sudo apt-get install git dos2unix n2n mc -y

  username="$(id -u -n)"
  cd ~
  git clone https://github.com/hosek/czadsb-scripts.git
  sudo chown $username:$username ~/czadsb-scripts

  sudo chmod +x ~/czadsb-scripts/*.sh
  sudo chmod +x ~/czadsb-scripts/**/*.sh

  # mkdir ~/downloads
  # sudo chown $username:$username ~/downloads
  # cd ~/downloads

  ~/czadsb-scripts/piaware_install.sh

  ~/czadsb-scripts/mlat_install.sh

  ~/czadsb-scripts/mm2_install.sh

  if [ -f "/etc/armbian-release" ]
  then
    ~/czadsb-scripts/armbian_specific.sh
  fi

  echo "copy n2n starter script"
  mkdir ~/n2n
  sudo cp ~/czadsb-scripts/starters/czadsb.n2n.sh ~/n2n/czadsb.n2n.sh
  sudo chmod +x ~/n2n/czadsb.n2n.sh
  sudo chown $username:$username ~/n2n/czadsb.n2n.sh

  echo "copy configs"
  sudo cp ~/czadsb-scripts/configs/czadsb-config.txt /boot/

  ~/czadsb-scripts/starters/autostart.sh

  ~/czadsb-scripts/addons/*.sh

  echo $file_version > $file


  #/boot/czadsb-boot.sh > /home/pi/boot-log.txt
  sudo sed -i '/^\/boot/d' /etc/rc.local

  echo "CZADSB tools installed."
  echo "Please edit /boot/czadsb-config.txt file"

else
    cd ~/czadsb-scripts
    git pull origin
    ~/czadsb-scripts/upgrade.sh
fi





