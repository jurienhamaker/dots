#!/bin/bash

ALIASES="alsa_output.usb-Logitech_G560_Gaming_Speaker_00000000-00.pro-output-0:Speakers\nalsa_output.usb-FIIO_FIIO_KA13-01.analog-stereo:Headset"

NEXT_SINK_NAME=($(wpctl status -n | grep -zoP '(?<=Sinks:)(?s).*?(?=├─)' | grep -a "vol:" | tr -d \* | awk '{print ($3)}' | grep $1 | head -1))
NEXT_SINK_ID=$(wpctl status -n | grep -zoP '(?<=Sinks:)(?s).*?(?=├─)' | grep -a $1 | awk '{print ($2+0)}')

if [ "$NEXT_SINK_ID" -eq "0" ]; then
	exit
fi

wpctl set-default "$NEXT_SINK_ID"
gdbus call --session \
	--dest org.freedesktop.Notifications \
	--object-path /org/freedesktop/Notifications \
	--method org.freedesktop.Notifications.CloseNotification \
	"$(cat /tmp/sss.id 2>/dev/null)" >/dev/null 2>&1
ALIAS=$(echo -e $ALIASES | grep $NEXT_SINK_NAME | awk -F ':' '{print ($2)}')

if [ -n "$2" ]; then
	exit
fi

gdbus call --session \
	--dest org.freedesktop.Notifications \
	--object-path /org/freedesktop/Notifications \
	--method org.freedesktop.Notifications.Notify \
	'Sound Switcher' 0 audio-volume-high \
	"Sound Switcher" "Switched to $ALIAS" [] \
	"{'transient': <true>}" 5000 |
	sed 's/(uint32 \([0-9]\+\),)/\1/g' >/tmp/sss.id
