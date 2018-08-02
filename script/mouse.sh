#!/bin/bash


device="Logitech Gaming Mouse G402"
state=$(xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$")

case $1 in
  "on")
    state=0
    ;;
  "off")
    state=1
    ;;
esac

if [ $state == '1' ];then
  xinput --disable "$device"
  xdotool mousemove 2000 1100
else
  xinput --enable "$device"
  xdotool mousemove 1000 500
fi
