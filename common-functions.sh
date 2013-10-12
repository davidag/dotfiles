#!/bin/bash
#==============================================================================
# File:         common-functions.sh
# Usage:        ----
# Description:  Common functions used in setup scripts.
#==============================================================================

FILE_EXT=".bck"
FOLDER_EXT="_bck"

#=== FUNCTION =================================================================
# Name:         check_and_install_package
# Description:  Checks if a packages is installed and installs it if not.
# Param 1:      package name
#==============================================================================
function check_and_install_package() {
    echo "Checking $1 package..."
    dpkg -s $1 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Package $1 not present. Installing..."
        sudo apt-get install $1
    fi
}

#=== FUNCTION =================================================================
# Name:         check_if_already_backed_up
# Description:  check if any of the params has been already backed up.
# Param n:      file or folder full path 
#==============================================================================
function check_if_already_backed_up() {
    for element in "$@"; do
        if [ -f "${element}$FILE_EXT" -o -d "${element}$FOLDER_EXT" ]; then
            echo "Previous backup found for '$element'"
            return 1
        fi
    done
    return 0
}

