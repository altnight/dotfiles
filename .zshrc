fpath=(
  $HOME/.zsh/*(/N)
  $fpath
)
autoload -U $(echo ~/.zsh/functions/*(:t))

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
autoload -U colors
colors

# VCS settings
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
PROMPT="%{$fg[cyan]%}[%n@%m %~%{$fg[yellow]%}%1v %{$fg[cyan]%}]%{$reset_color%} "
RPROMPT="[%D{%Y-%m-%d %H:%M:%S}]"

# LANG
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# editor
export EDITOR=vim

# config for pip
export PIP_DOWNLOAD_CACHE=${HOME}/.pip_cache
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUELENV=true
export VIRTUALENV_USE_DISTRIBUTE=1

# don't use crontab -r
function crontab() {
  for opt in "$@"; do
    if [ "$opt" == "-r" ]; then
      echo '-r is sealed!'
      return 1
    fi
  done
  command crontab "$@"
}

# load alias
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias

# load local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# autojump
[ -f ~/.autojump/etc/profile.d/autojump.zsh ] && source ~/.autojump/etc/profile.d/autojump.zsh

autoload -U compinit
compinit
