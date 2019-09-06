
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k config
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_TIME_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='white'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time battery)

# Plugins
#plugins=(zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages autojump)
source $ZSH/oh-my-zsh.sh

# aliases
alias c='clear'

# PATH 
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

