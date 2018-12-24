#!/bin/sh
set -ex

for pkg in git stow vim; do
    sudo apt install --yes $pkg
done

stow -v -S xorg
stow -v -S vim
stow -v -S git
stow -v -S bash

