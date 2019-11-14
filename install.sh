#!/bin/sh
set -e

for pkg in git stow vim; do
    { dpkg -l | grep -q " $pkg "; } && continue
    sudo apt install --yes $pkg
done

for dir in $(find . -maxdepth 1 -type d -name '[!.]*' | xargs basename -a); do
    stow -v -S "$dir"
done
