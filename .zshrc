fpath=(
  $HOME/.zsh/*(/N)
  $fpath
)
# autoload -U $(echo ~/.zsh/functions/*(:t))

export PATH=$HOME/local/bin:$PATH

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
setopt hist_ignore_all_dups
setopt share_history
# add history when command executed
setopt inc_append_history
# write stert/end datetime to history file
setopt extended_history
HISTSIZE=100000
SAVEHIST=100000

# editor
export EDITOR=vim
# key bind like emacs
bindkey -e
# jump word
bindkey "^W" forward-word
bindkey "^B" backward-word

# e.g. /etc -> cd /etc
setopt auto_cd
setopt auto_pushd

# complite
setopt rec_exact
setopt auto_pushd
# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups
# spell check
# setopt correct
# spell check
setopt correct_all
# forbbeden overwite redirect
setopt no_clobber
#
setopt list_packed
#
setopt list_types
# 補完候補が複数ある時に、一覧表示する
setopt auto_list
# complete argument startswith =
setopt magic_equal_subst
# complete bracket
setopt auto_param_keys
#
setopt auto_param_slash
# expand {a-c} to a b c
setopt brace_ccl
# detect symbolic link to concrete
#setopt chase_links
#
setopt auto_menu
# color complete
zstyle ':completion:*' list-colors di=34 fi=0
# no beep
setopt nolistbeep
#
setopt extended_glob


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

my=( $HOME/dotfiles/.zshrc.alias $HOME/dotfiles/.zshrc.local $HOME/.zsh/my/peco.zsh $HOME/.zsh/my/snippets.sh)

for file in ${my[@]}
  do
    echo _file
    [ -f $file ] && source $file
  done

autoload -U compinit
compinit
