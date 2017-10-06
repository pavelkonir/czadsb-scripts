#!/bin/sh

echo “blacklist dvb_usb_rtl2832u" | sudo tee /etc/modprobe.d/rtl-sdr-blacklist.conf -a
