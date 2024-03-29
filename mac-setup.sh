
# Ask for the administrator password up front
sudo -v

# Keep-alive; update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &




###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 
###############################################################################
echo "Setting up trackpad"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable “natural” scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable Key Repeat
defaults write -g ApplePressAndHoldEnabled -bool true




# Screen                                                                      
echo "Setting up screen"

# Save screenshots to Dropbox folder
defaults write com.apple.screencapture location -string "$HOME/Dropbox/Screenshots/"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2




###############################################################################
# Finder                                                                      
###############################################################################
echo "Setting up Finder"

# Show the ~/Library folder
chflags nohidden ~/Library

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable rearranging Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false

# Prevent Photos from opening when media is plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Increase go-to-fullscreen animation speed
defaults write -g NSWindowResizeTime -float 0.001

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Replace Finder window titles with directory path
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
# defaults write com.apple.finder ShowStatusBar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Avoid creating .DS_Store files on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Show item info below icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist

# Use icon view in all Finder windows by default
# Flwv ▸ Cover Flow View
# Nlsv ▸ List View
# clmv ▸ Column View
# icnv ▸ Icon View
defaults write com.apple.Finder FXPreferredViewStyle -string "icnv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Disable Quarantine—"This app has been downloaded from the internet. Sure you want to open it?" nonsense.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Restarts Finder
killall Finder




###############################################################################
# Dock & hot corners                                                          
###############################################################################
echo "Setting up Dock"

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 0

# Shorten the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 1.0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# restarts Dock
killall Dock




###############################################################################
# Git 
###############################################################################
echo "Setting up git"

git config --global user.name "Juan Valera"
git config --global user.email "jav094@gmail.com"




###############################################################################
# iTunes 
###############################################################################
# Stop Responding to Key Presses
# Doesn't work while System Integrity Protection is on
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist




###############################################################################
# Gatekeeper 
###############################################################################
# Turn off "app downloaded from internet" warnings
# You may still have to go into Prefs > Security & Privacy > General > "Allow apps downloaded from:" and set it to "Anywhere"
spctl --master-disable



###############################################################################
# Homebrew 
###############################################################################
echo "Setting up Homebrew apps"

# Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install your apps from a predefined Brewfile
brew bundle

# Clean up after yourself
brew cleanup




###############################################################################
# App Store apps 
###############################################################################
echo "Setting up App Store apps"

# Install mac app store command line
brew install mas

# Sign in
mas signin --dialog jav094@gmail.com

# Install apps:
# Keynote
mas install 409183694

# Numbers
mas install 409203825

# Pages
mas install 409201541

# GarageBand
mas install 682658836

# Affinity Photo
mas install 824183456

# Affinity Designer
mas install 824171161

# FB Messenger
mas install 1480068668

# Gaplin
mas install 768053424
