#!/usr/bin/env bash

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Sidebar icon size in finder
# Small  : 1
# Large  : 3
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
