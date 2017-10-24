#!/bin/sh

cp /boot/czadsb-config.txt config.txt

dos2unix ./config.txt

. ./config.txt

while [ "$N2N_VPN" = "yes" ]; do
  sleep 1m
  if [ ""'ping -c 1 n2n.czadsb.cz'"" ]; then
    echo "Attempt to start VPN";
    /usr/sbin/edge -a $N2N_IP -l n2n.czadsb.cz:82 -c adsb -k adsb123 -b &
    break;
  fi

done
