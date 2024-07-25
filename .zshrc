# Ensure correct paths are set
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/Cellar/bash/5.2.26/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export ANDROID_HOME=/Users/zhen/Library/Android/sdk
export JAVA_HOME=/opt/homebrew/opt/openjdk
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator

# Oh My ZSH initialization
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="arrow"
source $ZSH/oh-my-zsh.sh

# Zoxide setup
eval "$(zoxide init zsh)"
alias cd="z"

# Custom aliases
alias ls='eza -s=extension -a'
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

# Plugins configuration
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

# Load plugins
source $ZSH/oh-my-zsh.sh
