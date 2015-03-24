#!/bin/sh

# back up the originals to the local directory
sudo cp /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png ./finder_backup.png
sudo cp /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png ./finder@2x_backup.png

# copy in the new ones
sudo cp ./finder@2x.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png 
sudo cp ./finder@2x.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png 

# trash the iconcache, forcing the dock to rebuild it
sudo rm -f `sudo find /private/var/folders -name com.apple.dock.iconcache`

# restart the dock
sudo killall Dock
