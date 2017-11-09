#!/bin/sh

file_version=1.0.0


file="/boot/installed"

if ! grep -q $file_version "$file"; then
  echo "Upgrade running"


  

  echo "Upgrade finish"
  echo $file_version > $file
fi