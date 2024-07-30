# Ensure correct paths are set
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/Cellar/bash/5.2.26/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export ANDROID_HOME=/Users/zhen/Library/Android/sdk
export JAVA_HOME=/opt/homebrew/opt/openjdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Oh My ZSH initialization
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="arrow"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

# Load Oh My ZSH and plugins
source $ZSH/oh-my-zsh.sh

# Zoxide setup
eval "$(zoxide init zsh)"
alias cd="z"
alias cd..="cd ../"

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Alias for eza
alias ls='eza -s=ext -a -w=100'
