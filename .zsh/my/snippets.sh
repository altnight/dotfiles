reg(){echo $1 >> ~/.zsh/my/snippets.sh}  # $1, single quote
killtmux(){tmux list-sessions | percol | cut -d ":" -f 1 | xargs tmux kill-session -t}
