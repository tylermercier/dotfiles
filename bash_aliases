#!/bin/bash

alias shop="cd ~/Documents/github/shopify"

# terminal
alias ls="ls -G" #for color
alias ll="ls -alh"
alias grep="grep --color"
alias rm="rm -if"
alias mkdir="mkdir -p"
alias cp="cp -R"
alias flip="echo '(╯°□°）╯︵ ┻━┻'"

# tools
alias ipconfig="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
alias ports="lsof -i -P | grep -i 'listen'"
alias gitclean="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
alias gitsquish="git add --all :/ && git commit -m 'wip' && git rebase -i HEAD^^"
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias knife='BUNDLE_GEMFILE=/Users/tyler/Documents/github/shopify/ops/chef/knife-config/Gemfile bundle exec knife'

# rails
alias be="bundle exec"
alias bake="bundle exec rake"
alias bails="bundle exec rails"
alias makegood="binstall && migrate"
alias binstall="bundle check 2> /dev/null || bundle install --jobs 10"
alias migrate="bundle exec rake db:migrate db:test:prepare"
alias remigrate="bundle exec rake db:drop && rake db:create && rake db:migrate && rake db:schema:dump && rake db:test:prepare"

# kafka
alias killkafka="bash ~/dotfiles/scripts/kill-kafka"
alias clearkafka="bash ~/dotfiles/scripts/clear-kafka"

prompt_git() {
    local s=""
    local branchName=""

    # check if the current directory is in a git repository
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; printf "%s" $?) == 0 ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == "false" ]; then

            # ensure index is up to date
            git update-index --really-refresh  -q &>/dev/null

            # check for uncommitted changes in the index
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s="$s+";
            fi

            # check for unstaged changes
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s="$s!";
            fi

            # check for untracked files
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s="$s?";
            fi

            # check for stashed files
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s="$s$";
            fi

        fi

        # get the short symbolic ref
        # if HEAD isn't a symbolic ref, get the short SHA
        # otherwise, just give up
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                      git rev-parse --short HEAD 2> /dev/null || \
                      printf "(unknown)")"

        [ -n "$s" ] && s=" [$s]"

        printf "%s" "$1$branchName$s"
    else
        return
    fi
}

set_prompts() {
    local black=""
    local blue=""
    local bold=""
    local cyan=""
    local green=""
    local orange=""
    local purple=""
    local red=""
    local reset=""
    local white=""
    local yellow=""

    local hostStyle=""
    local userStyle=""

    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        tput sgr0 # reset colors

        bold=$(tput bold)
        reset=$(tput sgr0)

        black=$(tput setaf 0)
        blue=$(tput setaf 33)
        cyan=$(tput setaf 37)
        green=$(tput setaf 64)
        orange=$(tput setaf 166)
        purple=$(tput setaf 125)
        red=$(tput setaf 124)
        white=$(tput setaf 15)
        yellow=$(tput setaf 136)
    else
        bold=""
        reset="\e[0m"

        black="\e[1;30m"
        blue="\e[1;34m"
        cyan="\e[1;36m"
        green="\e[1;32m"
        orange="\e[1;33m"
        purple="\e[1;35m"
        red="\e[1;31m"
        white="\e[1;37m"
        yellow="\e[1;33m"
    fi

    # build the prompt

    # logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="\[$bold$red\]"
    else
        userStyle="\[$orange\]"
    fi

    # connected via ssh
    if [[ "$SSH_TTY" ]]; then
        hostStyle="\[$bold$red\]"
    else
        hostStyle="\[$yellow\]"
    fi

    # set the terminal title to the current working directory
    PS1="\[\033]0;\w\007\]"

    PS1+="\n" # newline
    PS1+="\[$userStyle\]\u" # username
    PS1+="\[$reset\]:"
    PS1+="\[$hostStyle\]\h" # host
    PS1+="\[$green\] \w" # working directory
    PS1+="\$(prompt_git \"$reset on $cyan\")" # git repository details
    PS1+="\n"
    PS1+="\[$reset$white\]↪ \[$reset\]" # $ (and reset color)

    export PS1
}

set_prompts
unset set_prompts
