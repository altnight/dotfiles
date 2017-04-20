#!/bin/bash

DOT_FILES=( .hgrc .vimrc)

for file in ${DOT_FILES[@]}
  do
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "embed: $file"
  done
