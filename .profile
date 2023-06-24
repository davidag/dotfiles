# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# add all ~/opt subdirectories to path
optdirs="$(find ~/opt -maxdepth 1 -type d)"
export PATH="$PATH:${optdirs//$'\n'/:}"

# add all ~/opt/**/bin directories to path
optdirs="$(echo ~/opt/**/bin)"
export PATH="$PATH:${optdirs// /:}"

export EDITOR=nvim
export TERMINAL=xterm
export PATH="$PATH:~/bin:~/local/bin:~/scripts:~/.local/bin/"
export LANG=en_US.UTF-8

# let apps choose their backend
# export GDK_BACKEND=wayland
# export GDK_BACKEND=x11

export PATH="$PATH:$HOME/.poetry/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/usr/local/go/bin"

# setup pyenv if installed
if [ -a "$HOME/.pyenv/bin/pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# ssh agent
export SSH_AUTH_SOCK="/run/user/$UID/ssh-agent.socket"
