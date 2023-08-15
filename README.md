My dotfiles
===========

These are the dotfiles I currently use. I work on Debian Linux, mainly doing Python programming. I'm working towards a keyboard-centric workflow, though there's much room for improvement.

I've gone through several dotfiles management alternatives and I'm finally going all in with making my $HOME folder a git repository. I expect this setup to be both less error-prone and more clear.

Usage:

    cd ~
    git init
    git remote add origin git@github.com:davidag/dotfiles.git
    git pull --force --recurse-submodules
