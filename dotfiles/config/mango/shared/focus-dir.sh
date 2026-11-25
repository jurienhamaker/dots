#!/bin/sh
# SUPER+J/K focus. In vertical_scroller, focusdir can't reach windows that are (nearly) off-screen,
# so walk the window stack there; every other layout keeps the spatial focusdir.
dir=$1
case $dir in
down) step=next ;;
up) step=prev ;;
*) exit 2 ;;
esac

mon=$(mmsg get focusing-client | jq -r '.monitor // empty')
sym=$([ -n "$mon" ] && mmsg get monitor "$mon" | jq -r '.layout_symbol')

if [ "$sym" = VS ]; then
	mmsg dispatch "focusstack,$step"
else
	mmsg dispatch "focusdir,$dir"
fi
