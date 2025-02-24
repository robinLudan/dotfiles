#!/bin/bash
# For disabling touchpad.
# use hyprctl devices to get your system touchpad device name
# Add TOUCHPAD_ENABLED variable in your hyprland config, see .config/hypr/settings.conf device

iDIR="$HOME/.local/share/icons/"
export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
	printf "true" >"$STATUS_FILE"
	notify-send -i "$iDIR/touchpad.png" -u low "Enabling touchpad"
	hyprctl keyword '$TOUCHPAD_ENABLED' "true" -r
}

disable_touchpad() {
	printf "false" >"$STATUS_FILE"
	notify-send -i "$iDIR/touchpad-disabled.png" -u low "Disabling touchpad"
	hyprctl keyword '$TOUCHPAD_ENABLED' "false" -r
}

if ! [ -f "$STATUS_FILE" ]; then
	enable_touchpad
else
	if [ $(cat "$STATUS_FILE") = "true" ]; then
		disable_touchpad
	elif [ $(cat "$STATUS_FILE") = "false" ]; then
		enable_touchpad
	fi
fi
