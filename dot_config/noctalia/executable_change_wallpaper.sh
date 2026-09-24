#!/usr/bin/env sh

# Change Noctalia wallpaper directory
# Usage: noctalia-set-wallpaper-dir "/path/to/wallpapers"

CONFIG_FILE="$HOME/.config/noctalia/config.toml"

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/wallpapers"
    exit 1
fi

# Validate the directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory does not exist: $1"
    exit 1
fi

# Escape the path for sed
ESCAPED_PATH=$(echo "$1" | sed 's/[&/\]/\\&/g')

# Check if [wallpaper] section exists
if ! grep -q "^\[wallpaper\]" "$CONFIG_FILE"; then
    echo "Error: [wallpaper] section not found in $CONFIG_FILE"
    exit 1
fi

awk -v new_path="$1" '
    /^\[wallpaper\]/ {
        in_wallpaper = 1
        print; next
    }
    /^\[/ && !/^\[wallpaper\]/ {
        in_wallpaper = 0
    }
    in_wallpaper && /^[[:space:]]*directory[[:space:]]*=/ {
        print "\tdirectory = \"" new_path "\""
        found = 1
        next
    }
    { print }
    END {
        if (!found && in_wallpaper) {
            print "\tdirectory = \"" new_path "\""
        }
    }
' "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"

echo "Updated wallpaper directory to: $1"

noctalia msg wallpaper-random
