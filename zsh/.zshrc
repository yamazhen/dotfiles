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
export EZA_COLORS='ex=38;2;120;153;120:fi=38;2;204;204;204:di=38;2;85;85;85:b0=38;2;215;0;0:or=38;2;215;0;0:ln=38;2;112;128;144:lp=38;2;112;128;144:lc=38;2;112;128;144:lm=38;2;112;128;144:bd=38;2;119;136;170:cd=38;2;119;136;170:pi=38;2;119;136;170:so=38;2;119;136;170:ur=38;2;122;122;122:uw=38;2;122;122;122:ux=38;2;122;122;122:ue=38;2;122;122;122:gr=38;2;122;122;122:gw=38;2;122;122;122:gx=38;2;122;122;122:tr=38;2;122;122;122:tw=38;2;122;122;122:tx=38;2;122;122;122:su=38;2;122;122;122:sf=38;2;122;122;122:xa=38;2;122;122;122:hd=38;2;68;68;68:bl=38;2;122;122;122:cc=38;2;122;122;122:da=38;2;122;122;122:in=38;2;122;122;122:xx=38;2;122;122;122:ga=38;2;120;153;120:gd=38;2;255;170;136:gm=38;2;119;136;170:gv=38;2;119;136;170:gt=38;2;119;136;170:df=38;2;122;122;122:ds=38;2;122;122;122:sb=38;2;85;85;85:sn=38;2;170;170;170:uu=38;2;85;85;85:un=38;2;85;85;85:gu=38;2;85;85;85:gn=38;2;85;85;85:sc=38;2;204;204;204:bu=38;2;204;204;204:cm=38;2;122;122;122:tm=38;2;122;122;122:co=38;2;122;122;122:do=38;2;122;122;122:cr=38;2;255;170;136:im=38;2;122;122;122:lo=38;2;122;122;122:mu=38;2;122;122;122:vi=38;2;122;122;122:mp=38;2;122;122;122'

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
