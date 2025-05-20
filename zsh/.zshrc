#oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_UPDATE_PROMPT="true"
ZSH_THEME="robbyrussell"

eval "$(zoxide init zsh)"

plugins=(git)
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^L' autosuggest-accept

#my config 
export PATH="/opt/homebrew/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH="$PATH:$HOME/.config/tmux"
export LESSKEY="$HOME/.config/zsh/.lesskey"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:#6e94b2,bg:-1,bg+:#141415
  --color=hl:#333738,hl+:#6e94b2,info:#606079,marker:#6e94b2
  --color=prompt:#f3be7c,spinner:#8cb66d,pointer:#cdcdcd,header:#c3c3d5
  --color=border:#252530,label:#aeaed1,query:#cdcdcd
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="$ "
  --marker=">" --pointer="" --separator="─" --scrollbar="│"
  --layout="reverse" --info="right"'

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
alias mvni="mvn -T 1C clean install -DskipTests"
alias springbuildcore="cd solvway-core-libs && mvn -T 1C clean install -DskipTests && cd .. && cd solvway-core-session && mvn -T 1C clean install -DskipTests && cd .."

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
