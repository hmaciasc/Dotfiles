#!/bin/bash

# Dark mode and reduce transparency
defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"
defaults write com.apple.universalaccess reduceTransparency -int 1

# Trackpad: enable tap to click and secondary click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -int 1

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -int 1
defaults write com.apple.universalaccess closeViewPanningMode -int 0

# Set up desktop icon view
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy kind" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 52" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom 0" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo 1" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show home folder when opening new windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Set the icon size of Dock items to 34 or 48 pixels depending on screen size
resolution=$(system_profiler SPDisplaysDataType | grep Resolution)
width=$(echo $resolution | cut -d ' ' -f 2)
height=$(echo $resolution | cut -d ' ' -f 4)

if [[ $(echo $resolution | cut -d ' ' -f 5) == 'Retina' ]]; then
	width=$(echo $width/2 | bc)
	height=$(echo $height/2 | bc)
fi

if [$height -gt 1000]; then
	defaults write com.apple.dock tilesize -int 48
else
	defaults write com.apple.dock tilesize -int 34
fi


# Hot corners
# Top left screen corner → Application Windows
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom right screen corner → Disable Screen Saver
defaults write com.apple.dock wvous-br-corner -int 6
defaults write com.apple.dock wvous-br-modifier -int 0
# Bottom left screen corner → Start Screen Saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Kill all affected apps
for app in "cfprefsd" "Dock" "Finder" "SystemUIServer"; do
	killall "${app}" > /dev/null 2>&1
done