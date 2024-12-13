#oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="arrow"

eval "$(zoxide init zsh)"

plugins=(git)
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#my config 
export PATH="/opt/homebrew/bin:$PATH"

# history setup
export HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[Z' autosuggest-accept
bindkey '^I' expand-or-complete


#aliases 
alias ls="eza -w 60"
alias cd="z"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
