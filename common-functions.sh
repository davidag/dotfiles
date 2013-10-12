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

#=== FUNCTION =================================================================
# Name:         do_backup
# Description:  backups a list of files and/or folders
# Param n:      file or folder full path 
#==============================================================================
function do_backup() {
    for element in "$@"; do
        if [ -f "$element" ]; then
            dst_file="${element}$FILE_EXT"
            echo "Moving file '$element' -> '$dst_file'"
            mv --no-clobber $element $dst_file || \
                { echo "Error $? moving file '$element'"; exit 1; }
        elif [ -d "$element" ]; then
            dst_folder="${element}$FOLDER_EXT"        
            echo "Moving folder '$element' -> '$dst_folder'"
            mv --no-clobber --no-target-directory $element $dst_folder || \
                { echo "Error $? moving folder '$element'"; exit 1; }
        fi
    done
}

#=== FUNCTION =================================================================
# Name:         do_restore
# Description:  restores a list of files and/or folders
# Param n:      file or folder full path 
#==============================================================================
function do_restore() {
    for element in "$@"; do
        backup_file_path="${element}$FILE_EXT"
        backup_folder_path="${element}$FOLDER_EXT"
        if [ -f "$backup_file_path" ]; then
            echo "File: $backup_file_path"
        elif [ -d "$backup_folder_path" ]; then
            echo "Folder: $backup_folder_path"
        else
            echo "Error: No backup for '$element'"
            return 1
        fi
    done
    return 0
}

