#!/bin/sh
  username="$(id -u -n)"
  sudo sed -i -e '$i /home/'$username'/mlat-client/czadsb.mlat-client.sh &\n' /etc/rc.local
  sudo sed -i -e '$i /home/'$username'/n2n/czadsb.n2n.sh &\n' /etc/rc.local
  sed -i "s/USERNAME/${username}/g" /home/$username/modesmixer2/czadsb.modesmixer.sh
  sudo sed -i -e '$i /home/'$username'/modesmixer2/czadsb.modesmixer.sh &\n' /etc/rc.local
