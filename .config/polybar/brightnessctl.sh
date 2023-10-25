#!/bin/sh
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}

if [ $BRIGHTNESS_NR -lt 6 ]; then
	BRIGHTNESS_ICON='󰃛'
elif [ $BRIGHTNESS_NR -lt 10 ]; then
	BRIGHTNESS_ICON='󰃞 '
elif [ $BRIGHTNESS_NR -lt 13 ]; then
	BRIGHTNESS_ICON='󰃠 '
else
	BRIGHTNESS_ICON='󰃚 '
fi

#echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"
echo "$BRIGHTNESS_ICON"
