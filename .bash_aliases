alias ga='git add'
alias gf='git fetch'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --stat'
alias gdcs='git diff --cached --stat'
alias gm='git commit -v'
alias gma='git commit --amend -v'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gr='git restore'
alias gpu='git pull'
alias gkdf='gitk --follow --all -p'
alias gl='git log --color --abbrev-commit --format=oneline HEAD'
alias glt='git log --color --abbrev-commit --graph --format=oneline master HEAD'
alias gw='git worktree'
alias gprune='git remote prune origin | cut -d/ -f2- | tail -n +3 | xargs git branch -d'

# Obtain WAN IP: https://askubuntu.com/questions/95910/command-for-determining-my-public-ip
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

# Shortcuts
alias g="grep"
alias v="vim"

# Filesystem
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias l='ls -lah --color=auto'
alias la='ls -AF --color=auto'
alias ll='ls -lFh --color=auto'
