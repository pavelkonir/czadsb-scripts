#!/bin/sh

cp /boot/czadsb-config.txt config.txt

dos2unix ./config.txt

. ./config.txt

/home/pi/modesmixer2/modesmixer2 $MM2_PARAMS
