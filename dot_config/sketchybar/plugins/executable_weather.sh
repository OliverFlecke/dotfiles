#!/usr/bin/env zsh

IP=$(curl -s https://ipinfo.io/ip)
LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

LOCATION="$(echo $LOCATION_JSON | jq -r '.city')"
REGION="$(echo $LOCATION_JSON | jq -r '.region')"
COUNTRY="$(echo $LOCATION_JSON | jq -r '.country')"

# Line below replaces spaces with +
LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"
WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=j1&M")

# Fallback if empty
if [ -z $WEATHER_JSON ]; then
    sketchybar --set $NAME label=$LOCATION
    sketchybar --set $NAME.moon icon=

    return
fi

TEMPERATURE=$(echo $WEATHER_JSON | jq -r '.current_condition[0].temp_C')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq -r '.current_condition[0].weatherDesc[0].value' | sed 's/\(.\{25\}\).*/\1.../')
MOON_PHASE=$(echo $WEATHER_JSON | jq -r '.weather[0].astronomy[0].moon_phase')
UV_INDEX=$(echo $WEATHER_JSON | jq -r '.current_condition[0].uvIndex')
WEATHER_CODE=$(echo $WEATHER_JSON | jq -r '.current_condition[0].weatherCode')

case ${MOON_PHASE} in
"New Moon")
    MOON_ICON=
    ;;
"Waxing Crescent")
    MOON_ICON=
    ;;
"First Quarter")
    MOON_ICON=
    ;;
"Waxing Gibbous")
    MOON_ICON=
    ;;
"Full Moon")
    MOON_ICON=
    ;;
"Waning Gibbous")
    MOON_ICON=
    ;;
"Last Quarter")
    MOON_ICON=
    ;;
"Waning Crescent")
    MOON_ICON=
    ;;
esac

case ${WEATHER_CODE} in
	"122") #     "VeryCloudy"
	WEATHER_ICON=󰖐
	;;
	"296") # LightRain
	;&
	"176") # LightShowers
	WEATHER_ICON=
	;;
	"113") # Sunny
	;&
	*) # Default to sunny
	
	;;
esac

sketchybar --set $NAME \
	label="$LOCATION $WEATHER_ICON $TEMPERATURE℃  $UV_INDEX $MOON_ICON" \
	icon.drawing=off \
	label.padding_left=8 \
	label.drawing=on

