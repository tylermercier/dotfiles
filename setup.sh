#!/bin/bash

echo "creating symlinks"
dotfiles=( bash_aliases bash_profile bashrc gemrc gitconfig gitignore tmux.conf vimrc vim )
for file in "${dotfiles[@]}"
do
  path="$(pwd)/$file"
  target="$HOME/.$file"
  echo "symlinking $path to $target"
  ln -sf $path $target
done
