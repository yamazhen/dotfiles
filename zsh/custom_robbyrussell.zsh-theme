# Made my own helper to see git status in the prompt
function git_ahead_behind() {
  local ahead behind
  ahead=$(git_commits_ahead)
  behind=$(git_commits_behind)
  
  if [[ -n "$ahead" && -n "$behind" ]]; then
    echo " %{$fg[red]%}↑$ahead%{$reset_color%}%{$fg[blue]%}↓$behind%{$reset_color%}"
  elif [[ -n "$ahead" ]]; then
    echo " %{$fg[red]%}↑$ahead%{$reset_color%}"
  elif [[ -n "$behind" ]]; then
    echo " %{$fg[blue]%}↓$behind%{$reset_color%}"
  fi
}

function custom_git_prompt() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  
  local dirty
  if [[ -n $(git status --porcelain 2> /dev/null) ]]; then
    dirty=" %{$fg[yellow]%}%1{✗%}%{$reset_color%}"
  else
    dirty=""
  fi
  
  echo "%{$fg_bold[cyan]%}git:(%{$fg[yellow]%}${ref#refs/heads/}%{$fg[cyan]%})$dirty%{$reset_color%}$(git_ahead_behind)"
}

PROMPT="%(?:%{$fg_bold[cyan]%}%1{➜%} :%{$fg_bold[yellow]%}%1{➜%} ) %{$fg[blue]%}%c%{$reset_color%}"
PROMPT+=' $(custom_git_prompt) '
