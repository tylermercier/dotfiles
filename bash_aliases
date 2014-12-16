alias shop="cd ~/Documents/github/shopify"

# terminal
alias ls="ls -G" #for color
alias ll="ls -alh"
alias grep="grep --color"
alias rm="rm -if"
alias mkdir="mkdir -p"
alias cp="cp -R"

# tools
alias ipconfig="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
alias ports="lsof -i -P | grep -i 'listen'"
alias gitclean="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
alias gitsquish="git add --all :/ && git commit -m 'wip' && git rebase -i HEAD^^"
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# rails
alias be="bundle exec"
alias bake="bundle exec rake"
alias bails="bundle exec rails"
alias migrate="bundle exec rake db:migrate db:test:prepare"
alias remigrate="bundle exec rake db:drop && rake db:create && rake db:migrate && rake db:schema:dump && rake db:test:prepare"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
else
    . /usr/local/etc/bash_completion
fi

function customize_command_prompt
{
    # colors
    local WHITE="\[\e[0m\]"
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local PURPLE="\[\033[0;34m\]"
    local PINK="\[\033[00;35m\]"
    local CYAN="\[\033[0;36m\]"

    # details
    local USER_INFO='\u@\h'
    local TIME='\t'
    local WORKING_DIRECTORY='\w'
    local PROMPT_GIT='$(__git_ps1)'
    local PROMPT_RUBY='$(__rbenv_ps1)'

    export PS1="${GREEN}${TIME}${PINK} [$PROMPT_RUBY]${CYAN}${PROMPT_GIT} ${YELLOW}${WORKING_DIRECTORY}\n${PINK}↪${WHITE} "
}

__rbenv_ps1 ()
{
    if command -v rbenv >/dev/null 2>&1; then
        rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
        printf $rbenv_ruby_version
    else
        printf "VAGRANT"
    fi
}

customize_command_prompt
