#!/bin/bash
#==============================================================================
# File:         setup-git.sh
# Usage:        setup-git.sh [-i|-u]
# Description:  Install the tools and files needed to use git repos.
#==============================================================================

source common-config.sh

#=== FUNCTION =================================================================
# Name:         usage
# Description:  Display usage information for this script.
# Params:       ---
#==============================================================================
function usage() {
    echo "Usage: $0 [-i|-u]"
    echo "  -i: installs the environment to work with git"
    echo "  -u: uninstalls the environment previously installed."
    exit 1
}

#=== FUNCTION =================================================================
# Name:         check_already_installed()
# Description:  Checks if there's a previous installation.
# Params:       ---
#==============================================================================
function check_git_config_already_installed() {
    if [ -f ~/.gitconfig.bck ]; then
        echo "Previous git info backup found! Abort"
        exit 1
    fi
}

#------------------------------------------------------------------------------
# Main program
#------------------------------------------------------------------------------

# Check script param
if [ "$1" != "-i" -a "$1" != "-u" ]; then
    usage
fi

# Install
if [ "$1" == "-i" ]; then
    echo "Checking if git config is already installed..."
    check_git_config_already_installed

    echo "Checking needed packages..."
    check_and_install_packages git-core

    if [ -f ~/.gitconfig ]; then
        echo "Backing up previous git global info in ~/.gitconfig.bck"
        cp --preserve ~/.gitconfig ~/.gitconfig.bck
    fi

    echo "Setting up your git global info..."
    read -p "Enter your name (firstname secondname): " name
    git config --global user.name "$name"
    if [ "$email" == "" ]; then
        read -p "Enter your e-mail address: " 
    fi
    git config --global user.email "$email"
    echo "Done!"
# Uninstall
else
    if [ -f ~/.gitconfig.bck ]; then
        echo "Restoring git global config..."
        cp --preserve ~/.gitconfig.bck ~/.gitconfig
        rm ~/.gitconfig.bck
    fi
fi

exit 0

