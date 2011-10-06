#!/bin/bash

echo "updating submodules for vim"
# git submodule add git@github.com:wincent/Command-T.git vim/bundle/command-t
# git submodule add git@github.com:altercation/vim-colors-solarized.git vim/bundle/vim-colors-solarized
# git submodule add git@github.com:bling/vim-airline.git vim/bundle/vim-airline
# git submodule add git@github.com:airblade/vim-gitgutter.git vim/bundle/vim-gitgutter
# git submodule add git@github.com:scrooloose/nerdtree.git vim/bundle/nerdtree
git pull && git submodule init && git submodule update && git submodule status

echo "creating symlinks"
dotfiles=( bash_aliases bash_command_prompt bash_profile bashrc gemrc gitconfig gitignore tmux.conf vimrc vim )
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
hg update -c 1e22adc6176e
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

echo "compiling command t vim plugin"
cd $HOME/.vim/bundle/command-t/ruby/command-t
/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby extconf.rb
make
