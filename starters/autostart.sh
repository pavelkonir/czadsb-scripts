#!/bin/sh
  username="$(id -u -n)"
  sudo sed -i -e '$i '$username'/mlat-client/czadsb.mlat-client.sh &\n' /etc/rc.local
  sudo sed -i -e '$i '$username'/n2n/czadsb.n2n.sh &\n' /etc/rc.local
  sudo sed -i -e '$i '$username'/modesmixer2/czadsb.modesmixer.sh &\n' /etc/rc.local