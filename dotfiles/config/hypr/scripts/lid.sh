#!/usr/bin/env bash

# monitor = eDP-1, modeline 311.83 2560 2744 3024 3488 1440 1441 1444 1490 -HSync +Vsync, 0x0, 1
# monitor = DP-1, modeline 311.83 2560 2744 3024 3488 1440 1441 1444 1490 -HSync +Vsync, 2560x0, 1

echo "$(date) - $(grep open /proc/acpi/button/lid/LID0/state)" >>~/.lid_log

if [[ "$(hyprctl monitors)" =~ DP-[0-9]+ ]]; then
	if grep open /proc/acpi/button/lid/LID0/state; then
		hyprctl keyword monitor "eDP-1, modeline 932.84 2880 3136 3456 4032 1800 1801 1804 1928 -HSync +Vsync, 0x0, 1 "
		hyprctl keyword monitor "DP-1, modeline 311.83 2560 2744 3024 3488 1440 1441 1444 1490 -HSync +Vsync, 2560x0, 1"
	else
		hyprctl keyword monitor "eDP-1,disable"
		hyprctl keyword monitor "DP-1, modeline 311.83 2560 2744 3024 3488 1440 1441 1444 1490 -HSync +Vsync, 0x0, 1"
	fi
	killall ags ydotool
	ags &
fi
