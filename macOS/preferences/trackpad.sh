#!/usr/bin/env bash

# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Trackpad Speed
# 0: Slow
# 3: Fast
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 3