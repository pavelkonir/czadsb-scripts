#!/bin/sh

if [ ! -f "/etc/armbian-release" ]
    then
     sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
     sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list
     sudo apt-get update
     sudo apt-get install rpimonitor -y
     sudo sudo apt-get -y -f install
     sudo /etc/init.d/rpimonitor update
fi
