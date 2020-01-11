#!/usr/bin/env bash

PREFERENCES_DIR=~/.dotfiles/macOs/preferences

main () {
    ask_for_sudo

    source ${PREFERENCES_DIR}/general.sh

    source ${PREFERENCES_DIR}/dock.sh
    source ${PREFERENCES_DIR}/finder.sh
    source ${PREFERENCES_DIR}/keyboard.sh
    source ${PREFERENCES_DIR}/menubar.sh
    source ${PREFERENCES_DIR}/mission-control.sh
    source ${PREFERENCES_DIR}/mouse.sh
    source ${PREFERENCES_DIR}/screensaver.sh
    source ${PREFERENCES_DIR}/trackpad.sh

    kill_affected_apps
}

function ask_for_sudo() {
    # Ask for the administrator password upfront
    sudo -v
    # Keep-alive: update existing `sudo` time stamp until script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

function kill_affected_apps() {
    apps_to_kill=(
        "Activity Monitor"
        "Calendar"
        "cfprefsd"
        "Contacts"
        "Dock"
        "Finder"
        "firefox"
        "Google Chrome"
        "Mail"
        "Messages"
        "Photos"
        "Safari"
        "Spectacle"
        "SystemUIServer"
        "Terminal"
    )
    for app in "${apps_to_kill[@]}"; do
        killall "${app}" &> /dev/null
    done
}

main "$@"
