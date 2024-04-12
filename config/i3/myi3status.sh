#!/bin/bash
# shell script to prepend i3status with more stuff

i3status -c ~/.i3/.i3status.conf | while :
do
	read line
	#LAYOUT=$(~/bin/xkb-switch)
	BRIGHT=$(cat /sys/class/backlight/acpi_video0/brightness)
	#dat=", { \"full_text\": \"💡 $BRIGHT\", \"color\": \"#999900\"}, { \"full_text\": \"🖮 $LAYOUT\", \"color\":\"#FF8C00\" }]"
	dat=", { \"full_text\": \"💡 $BRIGHT\", \"color\": \"#999900\"}]"
	echo "${line/]/$dat}" || exit 1
	#echo "LG: $LG | $line" || exit 1
done

