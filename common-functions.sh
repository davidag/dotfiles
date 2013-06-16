#!/bin/bash
#==============================================================================
# File:         common-functions.sh
# Usage:        ----
# Description:  Common functions used in setup scripts.
#==============================================================================


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


