#!/bin/bash

# Path to OneDrive binary
ONEDRIVE_BIN="/Applications/OneDrive.app/Contents/MacOS/OneDrive"

# Base settings directory
SETTINGS_DIR="$HOME/Library/Containers/com.microsoft.OneDrive-mac/Data/Library/Application Support/OneDrive/settings"

# 1. If OneDrive is already running, do nothing
if pgrep -x "OneDrive" >/dev/null 2>&1; then
#    echo "OneDrive already running, exiting."
    exit 0
fi

echo "OneDrive not running. Checking for lockfiles..."

# 2. Find lockfiles (your system uses LockInstance_*)
LOCKFILES=$(find "$SETTINGS_DIR" -type f -name "LockInstance_*" 2>/dev/null)

# Log what we found
echo "Found lockfiles:"
echo "$LOCKFILES"

# 3. Remove lockfiles if any
if [ -n "$LOCKFILES" ]; then
    echo "$LOCKFILES" | while read -r file; do
        echo "Removing: $file"
        rm -f "$file"
    done
else
    echo "No lockfiles found."
fi

# 4. Launch OneDrive
echo "Launching OneDrive..."
open -a "OneDrive"
