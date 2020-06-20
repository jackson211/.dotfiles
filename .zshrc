
#################################################
# Jackson Shi's zshrc config
#
#################################################


#################################################
# Zsh setting 
#################################################
setopt extended_glob
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


#################################################
# Theme
#################################################
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k config
POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_TIME_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='white'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=black
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=blue
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir dir_writable vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status time ram)


#################################################
# Plugins
#################################################
plugins=(zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages autojump)
source $ZSH/oh-my-zsh.sh

#################################################
# Aliases
#################################################
alias c='clear'
alias xs='vim ~/.zshrc'

#################################################
# PATH 
#################################################
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="/usr/local/texlive/2019/bin/x86_64-darwin:$PATH"
export PATH="/usr/local/Cellar/gcc/9.3.0_1/bin:$PATH"

#################################################
# Terminal
#################################################
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

