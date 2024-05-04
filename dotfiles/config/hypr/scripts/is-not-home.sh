#!/usr/bin/env bash

ip=$(ip -f inet -o addr show wlan0 | cut -d\  -f 7 | cut -d/ -f 1)

if [ "$ip" == "192.168.1.40" ]; then
	exit 1
fi

exit 0
