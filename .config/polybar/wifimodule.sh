#!/bin/sh

# get the network name
network_name=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)

# checking signal strength
signal=$(iw dev wlp4s0 link | grep signal | awk '{print $2}')

# Check if the network interface is up and has an IP address
if ip addr show wlp4s0 | grep -q "state UP" && ip addr show wlp4s0 | grep -q "inet "; then
  # Check if we can reach google.com
  if ping -q -c 3 -W 1 archlinux.org >/dev/null; then
    if (( signal > -50 )); then
      echo "󰤨  $network_name"
    elif (( signal > -70 )); then
      echo "󰤢  $network_name"
    else
      echo "󰤟  $network_name"
    fi
  else
    echo "󰤣  $network_name"
  fi
else
  echo "󰤮 no wifi" 
fi

# launch nwm_dmenu on left-click
if [[ "$1" == "click" ]]; then
  networkmanager_dmenu -fn 'Hack Nerd Font:size=14'
fi
