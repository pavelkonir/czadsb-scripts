#!/bin/sh
mm2Version="20170506"

cd ~/downloads

wget https://czadsb.cz/rx-images/utils/modesmixer2_rpi2-3_$mm2Version.tgz

mkdir ~/modesmixer2
cd ~/modesmixer2
tar -zxvf ~/downloads/modesmixer2_rpi2-3_$mm2Version.tgz

sudo chown pi:pi ~/modesmixer2

rm ~/downloads/modesmixer2_rpi2-3_$mm2Version.tgz
