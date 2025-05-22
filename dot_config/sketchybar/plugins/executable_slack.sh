#!/usr/bin/env sh
STATUS_LABEL=$(lsappinfo info -only StatusLabel "Slack")
ICON="󰒱"
PADDING=12

if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
	LABEL="${BASH_REMATCH[1]}"

	if [[ $LABEL == "" ]]; then
		ICON_COLOR="0xffa6da95"
		PADDING=0
	elif [[ $LABEL == "•" ]]; then
		ICON_COLOR="0xffeed49f"
	elif [[ $LABEL =~ ^[0-9]+$ ]]; then
		ICON_COLOR="0xffed8796"
	else
		exit 0
	fi
else
	exit 0
fi

settings=(
	icon=$ICON
	label.padding_right=$PADDING
	label=$LABEL
	icon.color=$ICON_COLOR
	click_script='aerospace focus --window-id $(aerospace list-windows --all | grep "Slack" | cut -d "|" -f 1)'
)
sketchybar --set $NAME "${settings[@]}"

