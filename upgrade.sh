#!/bin/sh

file_version=1.0.2


file="/boot/installed"

if ! grep -q $file_version "$file"; then
  echo "Upgrade running"
  if [[ $EUID -ne 0 ]]; then
    ./upgrade/mlat-upgrade.sh
  else
    echo "Spustte skript pod uzivatelem pouzitym pri instalaci (pravdepodobne pi)" 2>&1
    exit 1
  fi
 

  

  echo "Upgrade finish"
  sudo echo $file_version > $file
fi
