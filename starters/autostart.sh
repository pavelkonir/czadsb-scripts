#!/bin/sh

  sudo sed -i -e '$i \/home/pi/mlat-client/czadsb.mlat-client.sh &\n' /etc/rc.local
  sudo sed -i -e '$i \/home/pi/n2n/czadsb.n2n.sh&\n' /etc/rc.local
  sudo sed -i -e '$i \/home/pi/modesmixer2/czadsb.modesmixer.sh&\n' /etc/rc.local