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
