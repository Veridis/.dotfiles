#!/usr/bin/env bash

# Configure keyboard repeat 
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 1

# Disable "Correct spelling automatically"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

mmmmx