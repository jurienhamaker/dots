#!/usr/bin/env bash

# monitor = eDP-1, modeline 932.84 2880 3136 3456 4032 1800 1801 1804 1928 -HSync +Vsync, 0x0, 1
# monitor = DP-1, modeline 311.83 2560 2744 3024 3488 1440 1441 1444 1490 -HSync +Vsync, 2880x0, 1

echo "$(date) - $(grep open /proc/acpi/button/lid/LID0/state)" >>~/.lid_log

if grep open /proc/acpi/button/lid/LID0/state; then
	hyprctl keyword monitor "eDP-1, modeline 932.84 2880 3136 3456 4032 1800 1801 1804 1928 -HSync +Vsync, 0x0, 1 " >>~/.lid_log
	hyprctl keyword monitor "DP-1, modeline 311.83 2560 2744 3024 3488 1440 1441 1444 1490 -HSync +Vsync, 2560x0, 1" >>~/.lid_log

	sleep 1

	# Reset all workspaces to their configured monitor
	hyprctl dispatch moveworkspacetomonitor 1 1
	hyprctl dispatch moveworkspacetomonitor 2 1
	hyprctl dispatch moveworkspacetomonitor 3 1
	hyprctl dispatch moveworkspacetomonitor 4 0
	hyprctl dispatch moveworkspacetomonitor 5 1
	hyprctl dispatch moveworkspacetomonitor 6 0
	hyprctl dispatch moveworkspacetomonitor 7 0
	hyprctl dispatch moveworkspacetomonitor 8 1
	hyprctl dispatch moveworkspacetomonitor 9 1
	hyprctl dispatch moveworkspacetomonitor 10 1
else
	hyprctl keyword monitor "eDP-1,disable"
	hyprctl keyword monitor "DP-1, modeline 311.83 2560 2744 3024 3488 1440 1441 1444 1490 -HSync +Vsync, 0x0, 1"
fi

sleep 1

killall agsv1 ydotool
agsv1 &
