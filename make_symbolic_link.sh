#!/bin/bash

DOT_FILES=( .hgrc .vimrc)

ln -s $HOME/dotfiles/vimfiles/neobundle.vim $HOME/.vim/neobundle.vim

for file in ${DOT_FILES[@]}
  do
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "embed: $file"
  done
