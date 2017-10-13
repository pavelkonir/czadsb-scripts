#!/bin/sh

cp /boot/czadsb-config.txt config.txt

dos2unix ./config.txt

. ./config.txt

if [ "$MM2_ENABLE_OUTCONNECT" = "yes" ]; then

  /home/pi/modesmixer2/modesmixer2 $MM2_PARAMS --outConnect avr:czadsb.cz:$MM2_OUTCONNECT_PORT

else

  /home/pi/modesmixer2/modesmixer2 $MM2_PARAMS

fi
