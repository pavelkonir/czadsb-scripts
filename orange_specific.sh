#!/bin/sh

echo "***** Start script orange specific ******"

sleep 3

echo "blacklist dvb_usb_rtl2832u" | sudo tee /etc/modprobe.d/rtl-sdr-blacklist.conf -a

echo "***** End script orange specific ******"
