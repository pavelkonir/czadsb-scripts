#!/bin/sh

sudo cp /boot/czadsb-config.txt config.txt

dos2unix ./config.txt

. ./config.txt

if [ "$MM2_ENABLE_OUTCONNECT" = "yes" ]; then

  USERNAME/modesmixer2/modesmixer2 $MM2_PARAMS --outConnect avr:czadsb.cz:$MM2_OUTCONNECT_PORT

else

  USEERNAME/modesmixer2/modesmixer2 $MM2_PARAMS

fi
