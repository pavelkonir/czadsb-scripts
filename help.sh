cat /proc/device-tree/model
echo " "
cat /proc/cpuinfo | grep 'Revision'
cat /etc/os-release | grep VERSION=
cat /boot/installed
username="$(id -u -n)"


[ -f /boot/installed ] && echo "installed OK." || echo "/boot/installed NOT FOUND."
[ -f /boot/czadsb-config.txt ] && echo "czadsb-config.txt OK." || echo "/boot/czadsb-config.txt NOT FOUND."
[ -f ~/mlat-client/czadsb.mlat-client.sh ] && echo "czadsb.mlat-client.sh OK." || echo "home/pi/mlat-client/czadsb.mlat-client.sh NOT FOUND."
[ -f ~/modesmixer2/czadsb.modesmixer.sh ] && echo "czadsb.modesmixer.sh OK." || echo "/home/pi/modesmixer2/czadsb.modesmixer.sh NOT FOUND."
[ -f ~/n2n/czadsb.n2n.sh ] && echo "czadsb.n2n.sh OK." || echo "/home/pi/n2n/czadsb.n2n.sh NOT FOUND."
