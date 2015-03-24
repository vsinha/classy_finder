#!/bin/sh

SCRIPT_DIR=`dirname $0`

# copy the originals back to the original directory
sudo cp ${SCRIPT_DIR}/finder_backup.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png
sudo cp ${SCRIPT_DIR}/finder@2x_backup.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png

# trash the iconcache, forcing the dock to rebuild it
sudo rm -f `sudo find /private/var/folders -name com.apple.dock.iconcache 2> /dev/null`

# restart the dock
sudo killall Dock
