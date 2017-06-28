# setup
Sets a macOS machine up for a comfy dev environment

## what this configures
* Trackpad, keyboard, input
* Screenshot prefs
* Finder & Dock
* Terminal
* Animations
* A million other little things

## what this installs
* Homebrew apps
    * Development tools (Xcode, git, npm, etc.)
    * Third party apps
* Mac App Store apps

## how
> sh mac-setup.sh

## next, remember to:
* open apps that require further setup, like Wavebox & Spotify
* clone dotfiles repo into your user directory
* set up SSH keys
* finish installing some Casks (they need to run proprietary installers deposited in usr/local/Caskroom)
* install apps that don't have Casks:
    * Sketch - PluginManager
    * others