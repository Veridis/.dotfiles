#!/usr/bin/env bash

source ~/.dotfiles/utils.sh

TAP=${DOTFILES_REPO}/brew/Brewfile.tap
BREW=${DOTFILES_REPO}/brew/Brewfile.brew
CASK=${DOTFILES_REPO}/brew/Brewfile.cask

main() {
    e_header "BREW"

    e_subheader "Installing Homebrew..."
    install_homebrew

    e_subheader "Requiring Brewfiles..."
    install_packages_with_brewfile
}

# -----------------------------------------

function install_homebrew() 
{
    if hash brew 2>/dev/null; then
        e_note "Homebrew already exists"
    else
        url=https://raw.githubusercontent.com/Homebrew/install/master/install
        if yes | /usr/bin/ruby -e "$(curl -fsSL ${url})"; then
            e_success "Homebrew installation succeeded"
        else
            e_error "Homebrew installation failed"
            1
        fi
    fi
}

function install_packages_with_brewfile()
{
    # install parallel: https://www.gnu.org/software/parallel/
    if hash parallel 2>/dev/null; then
        e_note "parallel already exists"
    else
        if brew install parallel &> /dev/null; then
            printf 'will cite' | parallel --citation &> /dev/null
            e_success "parallel installation succeeded"
        else
            e_error "parallel installation failed"
            exit 1
        fi
    fi

    if (echo $TAP; echo $BREW; echo $CASK) | parallel --verbose --linebuffer -j 4 brew bundle check --file={} &> /dev/null; then
        e_success "Brewfile packages are already installed"
    else
        if brew bundle --file="$TAP"; then
            e_success "Brewfile.tap installation succeeded"

            if (echo $BREW; echo $CASK) | parallel --verbose --linebuffer -j 3 brew bundle --file={}; then
                e_success "Brewfile packages installation succeeded"
            else
                e_error "Brewfile packages installation failed"
                exit 1
            fi
        else
            e_error "Brewfile.tap installation failed"
            exit 1
        fi
    fi
}

main "$@"
