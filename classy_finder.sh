#!/bin/sh

SCRIPT_DIR=`dirname $0`

# back up the originals to the local directory
sudo cp /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png ${SCRIPT_DIR}/finder_backup.png
sudo cp /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png ${SCRIPT_DIR}/finder@2x_backup.png

# copy in the new ones
sudo cp ${SCRIPT_DIR}/finder@2x.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder@2x.png
sudo cp ${SCRIPT_DIR}/finder@2x.png /System/Library/CoreServices/Dock.app/Contents/Resources/finder.png

# trash the iconcache, forcing the dock to rebuild it
sudo rm -f `find /private/var/folders -name com.apple.dock.iconcache 2> /dev/null`

# restart the dock
sudo killall Dock
