set -x PATH $HOME/.homebrew/bin $PATH

# https://github.com/oh-my-fish/plugin-peco/blob/master/functions/peco_select_history.fish
function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=top-down
  else
    set peco_flags --layout=top-down --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]; commandline $foo
  else
    commandline ''
  end
end

# https://github.com/fisherman/z
# http://ka2n.hatenablog.com/entry/2017/01/09/fish_shell%E3%81%A7z%E3%81%AE%E7%B5%90%E6%9E%9C%E3%82%92peco%E3%81%A3%E3%81%A6%E7%88%86%E9%80%9F%E3%81%A7%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E7%A7%BB%E5%8B%95%E3%81%99%E3%82%8B
# ~/.config/fish/config.fish
function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
      cd $recent
      commandline -r ''
      commandline -f repaint
  end
end

function fish_user_key_bindings
  bind \cr peco_select_history
  bind \cq peco_z
end
