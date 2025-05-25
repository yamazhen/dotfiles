eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -z "$TMUX" ]; then
    exec tmux new-session -A -s main
fi
