#!/bin/bash

echo "creating symlinks"
dotfiles=( aliases gemrc gitconfig gitignore vimrc )
for file in "${dotfiles[@]}"
do
  path="$(pwd)/$file"
  target="$HOME/.$file"
  echo "symlinking $path to $target"
  ln -sf $path $target
done

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup

echo 'add the following to profile'
echo 'source ~/.aliases'