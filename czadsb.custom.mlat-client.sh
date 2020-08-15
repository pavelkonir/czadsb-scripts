#!/bin/sh

STATION_LAT=00.00000
STATION_LON=00.00000
STATION_ALT=000
STATION_NAME=“STATION NAME”

while true; do
  sleep 5
  ~/mlat-client/mlat-client --input-type dump1090 --input-connect localhost:30005 --results basestation,connect,czadsb.cz:31003 --lat $STATION_LAT --lon $STATION_LON --alt $STATION_ALT --server czadsb.cz:40147 --user "$STATION_NAME"
done

