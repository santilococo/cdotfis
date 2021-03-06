#!/usr/bin/env bash

cloneAndMake() {
    if [ -z "$password" ]; then
        password=$(whiptail --passwordbox "Enter your password" 8 25 3>&1 1>&2 2>&3)
        echo "$password" | sudo -S bash -c "" > /dev/null 2>&1
    fi
    
    local TERM=ansi; whiptail --infobox "Downloading '${1}'" 7 0
    git clone "$2"

    makeMsg=laptop && [[ -v LAPTOP ]] || makeMsg=install
    (cd "$1" || { echo "Couldn't cd into '$1'." 1>&2 && exit 1; }; echo "$password" | sudo make "$makeMsg")
}

downloadAndInstallPackages() {
    DOTFILES_CONFIG="$HOME/.config"
    cd "$DOTFILES_CONFIG" || { echo "Couldn't cd into '$DOTFILES_CONFIG'." 1>&2 && exit 1; }

    if [[ ! -d "dwmblocks" ]]; then
        cloneAndMake "dwmblocks" "https://github.com/santilococo/dwmblocks.git"
    fi
    if [[ ! -d "dwm" ]]; then
        cloneAndMake "dwm" "https://github.com/santilococo/dwm.git"
    fi
    if [[ ! -d "st" ]]; then
        cloneAndMake "st" "https://github.com/santilococo/st.git"
    fi
    if [[ ! -d "dmenu" ]]; then
        cloneAndMake "dmenu" "https://github.com/santilococo/dmenu.git"
    fi
    if [[ ! -d "clipmenu" ]]; then
        cloneAndMake "clipmenu" "https://github.com/cdown/clipmenu.git"
    fi
    if [[ ! -d "slock" ]]; then
        cloneAndMake "slock" "https://github.com/santilococo/slock.git"
    fi
}

runScript() {
    downloadAndInstallPackages
}

runScript
