#!/bin/bash

# Path to OneDrive binary
ONEDRIVE_BIN="/Applications/OneDrive.app/Contents/MacOS/OneDrive"

# Path to OneDrive lock file (Personal account)
LOCKDIR="$HOME/Library/Containers/com.microsoft.OneDrive-mac/Data/Library/Application Support/OneDrive/settings/Personal"
LOCKFILE="$LOCKDIR/Business1/InstanceID"

# 1. If OneDrive is already running, do nothing
if pgrep -x "OneDrive" >/dev/null 2>&1; then
    exit 0
fi

# 2. If OneDrive is NOT running, check for stale lock file
if [ -f "$LOCKFILE" ]; then
    rm -f "$LOCKFILE"
fi

# 3. Launch OneDrive
open -a "OneDrive"
