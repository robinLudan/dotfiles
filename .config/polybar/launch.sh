#!/bin/sh

# Kill the bar
killall -q polybar

# wait until the processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch the bar
polybar -c ~/.config/polybar/config.ini top

# setting a different bar for an external monitor
# will configure this later, just comment it for now :)
# if [[ $(xrandr-q | grep -i 'hdmi-2 connected']]; then
#   polybar -c ~/.config/polybar/config.ini top_external &
# fi
#
#counter=0
#bspc query -D --names | while read -r name; do
#  printf 'ws-icon-%i = "%s;<insert-icon-here>"\n' $((counter++)) $name
#done
