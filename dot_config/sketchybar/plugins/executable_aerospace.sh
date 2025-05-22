#!/usr/bin/env sh

if [[ -z "${FOCUSED_WORKSPACE}" ]]; then
	sketchybar --set space label=$(aerospace list-workspaces --focused)
else
	sketchybar --set space label="$FOCUSED_WORKSPACE"
fi

