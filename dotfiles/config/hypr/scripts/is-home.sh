#!/usr/bin/env bash

while [ -z "$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)" ]; do
	sleep 1
done

ip=$(ip -f inet -o addr show wlan0 | cut -d\  -f 7 | cut -d/ -f 1)

if [ "$ip" == "192.168.1.40" ]; then
	sleep $1
	$2
fi
