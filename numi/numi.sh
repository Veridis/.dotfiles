#!/usr/bin/env bash

NUMI_DIR=~/.dotfiles/numi
EXTENSIONS_DIR=~/Library/Application\ Support/com.dmitrynikolaev.numi/extensions

#ls "$EXTENSIONS_DIR"

# Initialise numi directory
mkdir -p ~/.numi
# symlink the example file
ln -sf "$NUMI_DIR"/example.numi ~/.numi
# symlink the extension file
ln -sf "$NUMI_DIR"/extensions/* "$EXTENSIONS_DIR"

# set default dir
defaults write com.dmitrynikolaev.numi NSNavLastRootDirectory -string "~/.numi"

killall Numi &> /dev/null
