#!/bin/sh
set -e

for pkg in git stow vim; do
    { dpkg -l | grep -q " $pkg "; } && continue
    sudo apt install --yes $pkg
done

stow -v -S xorg
stow -v -S vim
stow -v -S git
stow -v -S bash

