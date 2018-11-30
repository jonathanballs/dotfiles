# Configurations for zsh

# Path to oh-my-zsh installation.
export ZSH=/home/jonathan/.oh-my-zsh

zle -N up-line-or-history-beginning-search
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gnzh"

# Command auto completion settings
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="false"

# Auto update zsh
# To do it manually run `upgrade_oh_my_zsh`
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins are in ~/.oh-my-zsh/plugins/
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
#
# git: git status
# django: django autocomplete
# archlinux: pacman autocomplete
# websearch: includes `google` command
# vi-mode: extended vim
# jsontools: supplies pp_json, is_json etc.
# cp: uses rsync for copying
plugins=(git django archlinux web-search vi-mode colored-man-pages jsontools cp)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Use websearch function to search google
alias g="google"
alias ddv="dd dd status=progress"
alias dc="docker-compose"

# Check the weather
function wttr {
    curl wttr.in/$1
}

# Docker attach
function docka {
    docker exec -it $1 bash
}

function mkcd() {
    mkdir -p "$@" && cd $_
}

#
_zsh_cli_fg() { fg; }
zle -N _zsh_cli_fg
bindkey '^Z' _zsh_cli_fg

# Add ruby gems to path
export PATH="/home/jonathan/.gem/ruby/2.4.0/bin:$PATH"

# added by travis gem
[ -f /home/jonathan/.travis/travis.sh ] && source /home/jonathan/.travis/travis.sh

# diff-so-fancy
function pdiff() {
    git diff --no-index --color "$@" | diff-so-fancy
}

# Get the token for logging in
function kubetoken() {
    kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
}

# Open wayland gnome
alias startw='XDG_SESSION_TYPE=wayland dbus-run-session gnome-session'

# Add gems to PATH
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# Change kubernetes context for current shell
function kubecontexttmp() {
    export KUBECONFIG=/home/jonathan/.kube/config.$1
}

# Set user kubernetes cluster
function kubecontext() {
    if [ "$#" -eq 0 ]; then
        readlink ~/.kube/config | sed -E 's/.+config.//g'
    else 
        ln -s -f ~/.kube/config.$1 /home/jonathan/.kube/config
    fi
    unset KUBECONFIG
}

