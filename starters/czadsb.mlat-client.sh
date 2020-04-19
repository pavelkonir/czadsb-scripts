#!/bin/sh

cp /boot/czadsb-config.txt config.txt

dos2unix ./config.txt

. ./config.txt


while [ "$MLAT_CLIENT" = "yes" ]; do
  sleep 5
  mlat-client $MLAT_PARAMS --user "$STATION_NAME"
done