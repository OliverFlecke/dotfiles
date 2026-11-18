#!/usr/bin/env sh
# Installs/updates herdr's Claude hook script (~/.claude/hooks/herdr-agent-state.sh).
# The hook entry itself lives in dot_claude/private_settings.json. Skipped until herdr is installed via mise.
herdr=$(command -v herdr || mise which herdr 2>/dev/null) || exit 0
"$herdr" integration install claude
