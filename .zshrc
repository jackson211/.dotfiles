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

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


#################################################
# Theme
#################################################
#ZSH_THEME=""

# starship
eval "$(starship init zsh)"

#################################################
# Plugins
#################################################
plugins=(zsh-syntax-highlighting zsh-autosuggestions git colored-man-pages autojump)

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
source $ZSH/oh-my-zsh.sh
# autoload -Uz compinit && compinit
# source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#################################################
# Aliases
#################################################
alias c='clear'
alias ga='git add'
alias gm='git commit -m'
alias proxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias unproxy='unset https_proxy http_proxy all_proxy'

#################################################
# PATH 
#################################################
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="/usr/local/texlive/2019/bin/x86_64-darwin:$PATH"
export PATH="/usr/local/Cellar/gcc/10.1.0/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$WASMTIME_HOME/bin:$PATH"
export WASMTIME_HOME="$HOME/.wasmtime"

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

# autojump
[[ -s /Users/jackson/.autojump/etc/profile.d/autojump.sh ]] && source /Users/jackson/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

