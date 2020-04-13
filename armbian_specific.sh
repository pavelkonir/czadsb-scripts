#!/bin/sh

echo "***** Start script orange specific ******"

sleep 3

echo "blacklist dvb_usb_rtl2832u" | sudo tee /etc/modprobe.d/rtl-sdr-blacklist.conf -a

line="@reboot ~/czadsb-scripts/czadsb-install.sh"
(crontab -u root -l; echo "$line" ) | crontab -u root -

echo "***** End script orange specific ******"
