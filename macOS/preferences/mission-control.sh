#!/usr/bin/env bash

# Mission Control animation duration
defaults write com.apple.dock expose-animation-duration -float 0.1

# Dashboard:
# 1: Off
# 2: As Space
# 3: As Overlay
defaults write com.apple.dashboard enabled-state -int 1

# Spaces
# When switching to an application, switch to a Space with open windows for the application
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool true
# Do not automatically reorder spaces 
defaults write com.apple.dock mru-spaces -bool false
# Displays have seperate Spaces (false = yes)
defaults write com.apple.spaces spans-displays -bool false

# HotCorners
# wvous-*-modifier key to enable hot corner
#  0: no modifier
# wvous-*-values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
## bottom left: Mission Control
defaults write wvous-bl-corner -int 2
defaults write wvous-bl-modifier -int 0
## bottom right: Desktop
defaults write wvous-br-corner -int 4
defaults write wvous-br-modifier -int 2
