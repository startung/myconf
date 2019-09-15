#!/bin/bash


path="/sys/bus/hid/drivers/razerkbd/0003:1532:021E.0003"
#state=$(xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$")

case $1 in
  "breath")
    echo -n "1" > $path/matrix_effect_breath
    ;;
  "off")
    echo -n "1" > $path/matrix_effect_none
    ;;
  "spectrum")
    echo -n "1" > $path/matrix_effect_spectrum
    ;;
  "white")
    echo -n -e "\xFF\xFF\xFF"  > $path/matrix_effect_static
    ;;
  "red")
    echo -n -e "\xFF\x00\x00"  > $path/matrix_effect_static
    ;;
  "green")
    echo -n -e "\x00\xFF\x00"  > $path/matrix_effect_static
    ;;
  "blue")
    echo -n -e "\x00\x00\xFF"  > $path/matrix_effect_static
    ;;
  "reactive")
    echo -n -e "\x02\xFF\xFF\xFF"  > $path/matrix_effect_reactive
    ;;
  "full")
    echo -n "255"  > $path/matrix_brightness
    ;;
  "dim")
    echo -n "127"  > $path/matrix_brightness
    ;;

esac

