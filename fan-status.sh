#!/bin/sh
#Shell script to check fan status on ASUS laptops
fstat=$(cat /sys/devices/platform/asus-nb-wmi/fan_boost_mode)

case "$fstat" in
   "0") echo "Fan Mode: Balenced" 
   ;;
   "1") echo "Fan Mode: Overboost" 
   ;;
   "2") echo "Fan Mode: Silent" 
   ;;
   *) echo "Fan Mode: Unknown" 
esac
