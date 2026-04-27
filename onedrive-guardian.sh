#!/bin/bash

# Path to OneDrive binary
ONEDRIVE_BIN="/Applications/OneDrive.app/Contents/MacOS/OneDrive"

# Base settings directory
SETTINGS_DIR="$HOME/Library/Containers/com.microsoft.OneDrive-mac/Data/Library/Application Support/OneDrive/settings"

# 1. If OneDrive is already running, do nothing
if pgrep -x "OneDrive" >/dev/null 2>&1; then
    exit 0
fi

# 2. Find and remove any lock-like files
LOCKFILES=$(find "$SETTINGS_DIR" -type f \( -iname "*instance*" -o -iname "*lock*" -o -iname "*.dat" \) 2>/dev/null)

if [ -n "$LOCKFILES" ]; then
    echo "$LOCKFILES" | while read -r file; do
        rm -f "$file"
    done
fi

# 3. Launch OneDrive
open -a "OneDrive"
