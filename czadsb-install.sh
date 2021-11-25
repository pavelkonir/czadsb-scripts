#!/bin/sh

sudo touch /boot/ssh

file="/boot/installed"
file_version="1.0.4"

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


  echo "========== Updating system =========="
  #Update and upgrade
  sudo apt-get update --allow-releaseinfo-change
  sudo apt-get upgrade -y -f
  sudo apt-get install git dos2unix n2n mc -y

  username="$(id -u -n)"
  cd ~
  echo "========== Copying the CZADSB scripts =========="
  git clone https://github.com/pavelkonir/czadsb-scripts.git
  sudo chown $username:$username ~/czadsb-scripts

  sudo chmod +x ~/czadsb-scripts/*.sh
  sudo chmod +x ~/czadsb-scripts/**/*.sh

  mkdir ~/downloads
  sudo chown $username:$username ~/downloads
  cd ~/downloads

  echo "========== CZADSB scripts installation =========="

  ~/czadsb-scripts/piaware_install.sh && echo "========== Step (1/3) Piaware Installed ==========" || echo "========== Step (1/3) Piaware installation FAILED =========="

  ~/czadsb-scripts/mlat_install.sh && echo "========== Step (2/3) MLAT Installed ==========" || echo "========== Step (2/3) MLAT installation FAILED =========="

  ~/czadsb-scripts/mm2_install.sh && echo "========== Step (3/3) MM2 Installed ==========" || echo "========== Step (3/3) MM2 installation FAILED =========="

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

  sudo echo $file_version | sudo tee -a $file

  #/boot/czadsb-boot.sh > ~/boot-log.txt
  sudo sed -i '/^\/boot/d' /etc/rc.local


echo "================== File check ========================"
  sudo chmod +x ~/czadsb-scripts/help.sh
  [ -f /boot/installed ] && echo "installed OK." || echo "/boot/installed NOT FOUND."
  [ -f /boot/czadsb-config.txt ] && echo "czadsb-config.txt OK." || echo "/boot/czadsb-config.txt NOT FOUND."
  [ -f ~/mlat-client/czadsb.mlat-client.sh ] && echo "czadsb.mlat-client.sh OK." || echo "home/pi/mlat-client/czadsb.mlat-client.sh NOT FOUND."
  [ -f ~/modesmixer2/czadsb.modesmixer.sh ] && echo "czadsb.modesmixer.sh OK." || echo "/home/pi/modesmixer2/czadsb.modesmixer.sh NOT FOUND."
  [ -f ~/n2n/czadsb.n2n.sh ] && echo "czadsb.n2n.sh OK." || echo "/home/pi/n2n/czadsb.n2n.sh NOT FOUND."

  echo "██████╗███████╗ █████╗ ██████╗ ███████╗██████╗ "
  echo "██╔════╝╚══███╔╝██╔══██╗██╔══██╗██╔════╝██╔══██╗"
  echo "██║       ███╔╝ ███████║██║  ██║███████╗██████╔╝"
  echo "██║      ███╔╝  ██╔══██║██║  ██║╚════██║██╔══██╗"
  echo "╚██████╗███████╗██║  ██║██████╔╝███████║██████╔╝"
  echo "╚═════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ "
                                                  
  echo "CZADSB tools installed."
  echo "Please edit /boot/czadsb-config.txt file"

else
     username="$(id -u -n)"
     sudo chown $username:$username -R ~/czadsb-scripts
     cd ~/czadsb-scripts
     git reset --hard
     git pull origin
     sudo chmod +x upgrade.sh
     ./upgrade.sh
fi





