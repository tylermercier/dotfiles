#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Configure go
export GOPATH=$HOME
export GO111MODULE=on

export PATH="/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH"

# Ansi Colors in iTerm2
export CLICOLOR=1

# Default to vim as editor
export EDITOR=vim

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi
if [ -e /Users/tylermercier/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/tylermercier/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
