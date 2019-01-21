#!/bin/bash

echo "creating symlinks"
dotfiles=( bash_aliases bash_profile bashrc bash_prompt gemrc gitconfig gitignore vimrc )
for file in "${dotfiles[@]}"
do
  path="$(pwd)/$file"
  target="$HOME/.$file"
  echo "symlinking $path to $target"
  ln -sf $path $target
done

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
