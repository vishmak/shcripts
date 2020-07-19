#!/bin/sh
#Shell script to check and control fan speed on ASUS laptops

fstat=$(cat /sys/devices/platform/asus-nb-wmi/fan_boost_mode)

case "$1" in
   "")      echo "Status"
            case "$fstat" in
            "0") echo "Fan Mode: Balenced" 
            ;;
            "1") echo "Fan Mode: Overboost" 
            ;;
            "2") echo "Fan Mode: Silent" 
            ;;
            *) echo "Fan Mode: Unknown" 
            esac
         ;;
   "boost") echo "Fan mode set to Overboost mode"
            echo 1 > /sys/devices/platform/asus-nb-wmi/fan_boost_mode
         ;;
   "silent")   echo "Fan mode set to Silent mode"
               echo 2 > /sys/devices/platform/asus-nb-wmi/fan_boost_mode
         ;;
   "normal")   echo "Fan mode set to Balenced mode"
               echo 0 > /sys/devices/platform/asus-nb-wmi/fan_boost_mode
         ;;
   *)          echo "Unknown Option"
esac
