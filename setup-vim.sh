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

# Check script param
if [ "$1" != "-i" -a "$1" != "-u" ]; then
    usage
fi

# Install
if [ "$1" == "-i" ]; then
    echo "Checking vim config already installed..."
    check_if_already_backed_up $VIMRC $VIMFOLDER || \
        { echo "Aborting installation..."; exit 1; }

    echo "Checking needed packages..."
    check_and_install_package vim

    if [ -f "$VIMRC" ]; then
        echo "Backing up previous vim config in $VIMRC_BACKUP and $VIMFOLDER_BACKUP"
#        do_backup_file $VIMRC
#        do_backup_folder $VIM_FOLDER $VIM_BACKUP
        echo "cp --preserve $VIMRC $VIMRC_BACKUP"
        echo "cp --preserve $VIMFOLDER $VIMFOLDER_BACKUP"
    fi

    echo "cp --preserve vimrc $VIMRC"
    echo "cp --preserve vim $VIMFOLDER"

    echo "Done!"
# Uninstall
else
    if [ -f $VIMRC_BACKUP ]; then
        echo "Restoring previous config..."
        echo "mv $VIMRC_BACKUP $VIMRC"
        echo "mv $VIMFOLDER_BACKUP $VIMFOLDER"
    else
        echo "Error: No previous config found!"
        exit 1
    fi
fi

exit 0

