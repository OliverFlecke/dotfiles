#!/usr/bin/env sh

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
# IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

# if [[ $IS_VPN != "" ]]; then
# 	COLOR=$CYAN
# 	ICON=
# 	LABEL="VPN"

if [[ $IP_ADDRESS != "" ]]; then
	COLOR=0xff7ed321
	ICON=
	LABEL=$IP_ADDRESS
else
	COLOR=0xffffffff
	ICON=󰖪
	LABEL="Not Connected"
fi

settings=(
	icon=$ICON
	icon.color=$COLOR
	icon.padding_right=8
	label.drawing=off
	label=$INFO
)
sketchybar --set $NAME "${settings[@]}"
