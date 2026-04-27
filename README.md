# onedrivewatcher

`com.user.onedrivewatcher.plist` goes into `~/Library/LaunchAgent`

`onedrive-guardian.sh` goes into the home directory with `chmod +x ~/onedrive-guardian.sh
`

commands for managing the plist

```
launchctl unload ~/Library/LaunchAgents/com.user.onedrivewatcher.plist 2>/dev/null

launchctl load ~/Library/LaunchAgents/com.user.onedrivewatcher.plist

````