#!/bin/bash
#==============================================================================
# File:         setup-vim.sh
# Usage:        setup-vim.sh [-i|-u]
# Description:  Install vim config file.
#==============================================================================

source common-functions.sh

VIMRC="~/.vimrc"
VIMRC_BACKUP="~/.vimrc.bck"
VIM_FOLDER="~/.vim"
VIM_FOLDER_BACKUP="~/.vim_bck"

#=== FUNCTION =================================================================
# Name:         usage
# Description:  Display usage information for this script.
# Params:       ---
#==============================================================================
function usage() {
    echo "Usage: $0 [-i|-u]"
    echo "  -i: installs vim configuration"
    echo "  -u: uninstalls vim configuration and restores the previous one"
    exit 1
}

#=== FUNCTION =================================================================
# Name:         check_already_installed()
# Description:  Checks if there's a previous installation.
# Params:       ---
#==============================================================================
function check_already_installed() {
    if [ -f $VIMRC_BACKUP -o -d $VIM_FOLDER_BACKUP ]; then
        echo "Previous vim backup found in $VIMRC_BACKUP or $VIM_FOLDER_BACKUP"
        echo "Aborting installation..."
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
    echo "Checking already installed..."
    check_already_installed

    echo "Checking needed packages..."
    check_and_install_package vim

    if [ -f $VIMRC ]; then
        echo "Backing up previous vim config in $VIMRC_BACKUP and $VIM_FOLDER_BACKUP"
        cp --preserve $VIMRC $VIMRC_BACKUP
        cp --preserve $VIM_FOLDER $VIM_FOLDER_BACKUP
    fi

    cp vimrc $VIMRC
    cp vim $VIMFOLDER

    echo "Done!"
# Uninstall
else
    if [ -f $VIMRC_BACKUP ]; then
        echo "Restoring previous config..."
        mv $VIMRC_BACKUP $VIMRC
        mv $VIM_FOLDER_BACKUP $VIM_FOLDER
    else
        echo "No previous config found!"
        exit 1
    fi
fi

exit 0
