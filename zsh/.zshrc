# Configurations for zsh

# Path to oh-my-zsh installation.
  export ZSH=/home/jonathan/.oh-my-zsh

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git: git status
# django: django autocomplete
# archlinux: pacman autocomplete
# websearch: includes `google` command
plugins=(git django archlinux web-search vi-mode colored-man-pages jsontools)

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

