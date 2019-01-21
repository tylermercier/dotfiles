#!/bin/bash

# terminal
alias ls="ls -G" #for color
alias ll="ls -alh"
alias grep="grep --color"
alias rm="rm -if"
alias mkdir="mkdir -p"
alias cp="cp -R"

# code
alias workspace="cd ~/src/github.com"
alias shop="cd ~/src/github.com/Shopify"
alias devnuke="dev up && dev reset-railgun && dev up"
alias gitclean="git branch --merged master | grep -v master | xargs -n 1 git branch -d"
alias gitsquish="git add --all :/ && git commit -m 'wip' && git rebase -i HEAD^^"

# kubernetes
alias contexts="kubectl config view -o jsonpath='{.contexts[*].name}' | tr ' ' '\n'"

# tools
alias weather="curl http://wttr.in"
alias ipconfig="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
alias ports="lsof -i -P | grep -i 'listen'"
