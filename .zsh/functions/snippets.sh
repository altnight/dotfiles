reg(){echo $1 >> ~/.zsh/functions/snippets.sh}  # $1, single quote
killtmux(){tmux list-sessions | percol | cut -d ":" -f 1 | xargs tmux kill-session -t}
