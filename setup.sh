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

echo "creating tmp directory for vim files"
mkdir ~/tmp

echo "building vim from source"
cd /tmp
hg clone https://vim.googlecode.com/hg/ vim
cd vim
hg update -c a8993ea8dec2
./configure --prefix=/usr/local \
              --enable-gui=no \
              --without-x \
              --disable-nls \
              --enable-multibyte \
              --with-tlib=ncurses \
              --enable-pythoninterp \
              --enable-rubyinterp \
              --with-ruby-command=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby \
              --with-features=huge
make
sudo make install
