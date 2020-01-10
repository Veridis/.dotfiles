#!/usr/bin/env bash

# Auto hide the dock
defaults write com.apple.dock autohide -bool true

# Set Dock position: left | bottom | right
defaults write com.apple.dock orientation -string bottom

# magnify the dock on hover
defaults write com.apple.dock magnification -bool true
# magnify effect: genie | scale
defaults write com.apple.dock mineffect -string genie

# Icon size of Dock items
#  When not hovered
defaults write com.apple.dock tilesize -int 16
#  When hovered
defaults write com.apple.dock largesize -int 128

# Animate apps on launch
defaults write com.apple.dock launchanim -bool true

# Display a dot indicator on open apps
defaults write com.apple.dock show-process-indicators -bool true

# Do not show recently openned apps
defaults write com.apple.dock show-recents -bool false
