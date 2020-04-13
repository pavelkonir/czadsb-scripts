#!/bin/sh

  sudo sed -i -e '$i ~/mlat-client/czadsb.mlat-client.sh &\n' /etc/rc.local
  sudo sed -i -e '$i ~/n2n/czadsb.n2n.sh &\n' /etc/rc.local
  sudo sed -i -e '$i ~/modesmixer2/czadsb.modesmixer.sh &\n' /etc/rc.local