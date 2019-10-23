set -x PATH $HOME/.homebrew/bin $PATH

function select_history

  history | sort | uniq | fzf --layout=reverse --height 50% | read foo

  if [ $foo ]; commandline $foo
  else
    commandline ''
  end
end

function fish_user_key_bindings
  bind \cr select_history
end
