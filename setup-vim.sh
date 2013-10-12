#!/bin/bash
#==============================================================================
# File:         setup-vim.sh
# Usage:        setup-vim.sh [-i|-u]
# Description:  Install vim config file.
#==============================================================================

source common-functions.sh

VIMRC="$HOME/.vimrc"
VIMRC_BACKUP="$HOME/.vimrc.bck"
VIMFOLDER="$HOME/.vim"
VIMFOLDER_BACKUP="$HOME/.vim_bck"

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

#------------------------------------------------------------------------------
# Main program
#------------------------------------------------------------------------------

if [ "$1" != "-i" -a "$1" != "-u" ]; then
    usage
fi

if [ "$1" == "-i" ]; then
    echo "Checking vim config already installed..."
    check_if_already_backed_up $VIMRC $VIMFOLDER || \
        { echo "Aborting installation..."; exit 1; }

    echo "Checking needed packages..."
    check_and_install_package vim

    echo "Backing up your files..."
    do_backup $VIMRC $VIMFOLDER

    echo "do_install vimrc $VIMRC"
    echo "do_install vim $VIMFOLDER"

    echo "Done!"
else
    if [ -f $VIMRC_BACKUP ]; then
        echo "Restoring previous config..."
        echo "do_restore $VIMRC_BACKUP $VIMRC"
        echo "do_restore $VIMFOLDER_BACKUP $VIMFOLDER"
    else
        echo "Error: No previous config found!"
        exit 1
    fi
fi

exit 0

