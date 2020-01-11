#!/usr/bin/env bash

DOTFILES_REPO=~/.dotfiles

function symlink() {
    application=$1
    point_to=$2
    destination=$3
    destination_dir=$(dirname "$destination")

    if test ! -e "$destination_dir"; then
        e_arrow "Creating ${destination_dir}"
        mkdir -p "$destination_dir"
    fi
    if rm -rf "$destination" && ln -s "$point_to" "$destination"; then
        e_success "Symlinking for \"${application}\" done"
    else
        e_error "Symlinking for \"${application}\" failed"
        exit 1
    fi
}

# COLORS
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

e_header() { 
    printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@" 
}
e_subheader() { 
    printf "${purple}----------  %s${reset}\n" "$@" 
}
e_arrow() { 
    printf "➜ $@\n"
}
e_success() { 
    printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { 
    printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { 
    printf "${tan}➜ %s${reset}\n" "$@"
}
e_note() {
    printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}
e_underline() { 
    printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { 
    printf "${bold}%s${reset}\n" "$@"
}
