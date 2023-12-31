#!/bin/sh

if [[ -f "/usr/bin/swayidle" ]]; then
	echo "SwayIdle is installed"
	swayidle -w timeout 120 'swaylock' timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock'
else
	echo "SwayIdle not Installed"
fi
