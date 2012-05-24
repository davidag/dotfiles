#!/bin/bash
#==============================================================================
# File:         setup.sh
# Usage:        setup.sh [-i|-u]
# Description:  Installs the tools and files needed to use github repos.
#==============================================================================

SSH_KEYS="./ssh_keys"

#=== FUNCTION =================================================================
# Name:         usage
# Description:  Display usage information for this script.
# Params:       ---
#==============================================================================
function usage() {
    echo "Usage: $0 [-i|-u]"
    echo "  -i: installs the environment to work with github"
    echo "  -u: uninstalls the environment previously installed."
    echo "Note: Your SSH keys must reside in the subfolder $SSH_KEYS"
    echo " as they will be copied in ~./ssh (after backing up the old"
    echo " ones)."
    exit 1
}

#=== FUNCTION =================================================================
# Name:         check_and_install_package
# Description:  Checks if a packages is installed and installs it if not.
# Param 1:      package name
#==============================================================================
function check_and_install_package() {
    echo "Checking $1 package..."
    dpkg -s $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Installing $1..."
        sudo apt-get install $1
    else
        echo "$1 is already installed"
    fi
}

#------------------------------------------------------------------------------
# Main program
#------------------------------------------------------------------------------

# Check script param
if [ $# -ne 1 ] || [ "$1" != "-i" -a "$1" != "-u" ]; then
    usage
fi

# Install
if [ "$1" == "-i" ]; then
    # Checking backups
    if [ -d ~/.ssh/key_backup ]; then
        echo "Previous ssh key backup found! Abort"
        exit 1
    fi
    if [ -f ~/.gitconfig.bck ]; then
        echo "Previous git info backup found! Abort"
        exit 1
    fi

    echo "Checking needed packages..."
    check_and_install_package git-core
    check_and_install_package openssh-client
    if [ -d ~/.ssh ]; then
        echo "Backing up keys at ~/.ssh in ~/.ssh/key_backup"
        mkdir ~/.ssh/key_backup
        cp --preserve ~/.ssh/id_rsa* ~/.ssh/key_backup
        rm ~/.ssh/id_rsa*
    else
        mkdir ~/.ssh
    fi
    
    email=
    if [ -d "$SSH_KEYS" ] && ls $SSH_KEYS/id_rsa* 2> /dev/null; then
        echo "Installing your ssh key pair in ~/.ssh ..."
        cp $SSH_KEYS/id_rsa* ~/.ssh
    else
        echo "You have not provided an ssh key pair in $SSH_KEYS"
        read -p "Do you want to create one now? (y/n) " yesno
        if [ "$yesno" == "y" -o "$yesno" == "Y" ]; then
            read -p "Enter your e-mail address: " email
            ssh-keygen -t rsa -C "$email"
            echo "Remember to add you ssh key to GitHub"
        else
            exit 1
        fi
    fi

    if [ -f ~/.gitconfig ]; then
        echo "Backing up previous git global info in ~/.gitconfig.bck"
        cp --preserve ~/.gitconfig ~/.gitconfig.bck
    fi
    echo "Setting up your global info..."
    read -p "Enter your name (firstname secondname): " name
    git config --global user.name "$name"
    if [ "$email" == "" ]; then
        read -p "Enter your e-mail address: " 
    fi
    git config --global user.email "$email"
    echo "Done!"
# Uninstall
else
    if [ -d ~/.ssh/key_backup ]; then
        echo "Restoring key_backup..."
        cp --preserve ~/.ssh/key_backup/id_rsa* ~/.ssh
        rm --recursive ~/.ssh/key_backup
    fi
    if [ -f ~/.gitconfig.bck ]; then
        echo "Restoring git global config..."
        cp --preserve ~/.gitconfig.bck ~/.gitconfig
        rm ~/.gitconfig.bck
    fi
fi

exit 0
