# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=999999
export HISTFILESIZE=999999

# Don't save 1- or 2-letter commands, or space-started commands, or duplicates.
export HISTIGNORE='?:??: *:&'

# append last history item before each command prompt
export PROMPT_COMMAND='history -a'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# 'Safe' version of __git_ps1 to avoid errors on systems that don't have it
function gitPrompt {
    command -v __git_ps1 > /dev/null && __git_ps1 "(%s)"
}

function venvPrompt {
	[ -z "$VIRTUAL_ENV" ] && echo "" || echo "[$(basename $VIRTUAL_ENV)]"
}

txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtwht='\[\e[0;37m\]' # White
bldblu='\[\e[1;34m\]' # Blue
bldcyn='\[\e[1;36m\]' # Cyan

export PS1="${bldcyn}\w ${txtgrn}\$(gitPrompt) ${txtylw}\$(venvPrompt) \n${bldcyn}>${bldblu}>${txtwht} "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# debian package utilities
pkg-search() {
	apt-cache show "$1" 2>/dev/null
	[ $? -eq 0 ] && return
	dpkg -S "$(which $1)" | cut -d':' -f1 | xargs apt-cache show
	[ $? -eq 0 ] && return
	apt-file search "$1"
}

# python
activate() {
	deactivate 2> /dev/null
	[ -d "venv" ] && source venv/bin/activate && echo "Activated $VIRTUAL_ENV"
	[ -d ".venv" ] && source .venv/bin/activate && echo "Activated $VIRTUAL_ENV"
	[ -z "$VIRTUAL_ENV" ] && echo "Error: No venv or .venv directory in current path"
}

# python pip upgrade packages
pip-upgrade() {
	pip list --outdated --format=freeze \
		| grep -v '^\-e' \
		| cut -d'=' -f1 \
		| xargs -n1 pip install -U
}

# unzip file to folder of same name
unzd() {
	if [[ $# != 1 ]]; then echo Single argument required; return 1; fi
	target="${1%.zip}"
	unzip "$1" -d "${target##*/}"
}

# bigger $2 files/folders in directory $1
topf() {
	local dir="${1:-.}"
	local num="${2:-10}"
	du -ha $dir | sort -hr | head -n $num
}

# notes
jrnl() {
	cd $HOME/notes
	local journal_file="journals/$(date +%Y-w%W).md"
	vim $journal_file
}

# Disable npm update notifier to reduce execution time and possible hangs.
export NO_UPDATE_NOTIFIER=

# Disable CTRL+S/Q (XON/XOFF flow control)
# https://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal
stty -ixon

# Disable Python bytecode generation (*.pyc)
export PYTHONDONTWRITEBYTECODE=1

# Disable pyenv prompt
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# local config
if [ -f ~/.bash_local ]; then
    source ~/.bash_local
fi

