# terminal
alias ls="ls -G" #for color
alias ll="ls -alh"
alias grep="grep --color"
alias rm="rm -if"
alias mkdir="mkdir -p"
alias cp="cp -R"

alias shop="cd ~/Documents/github/shopify"

# tools
alias ipconfig="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
alias ports="lsof -i -P | grep -i 'listen'"
alias bc="git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
alias fs="foreman start -f Procfile.dev"

# rails
alias be="bundle exec"
alias bake="bundle exec rake"
alias bails="bundle exec rails"
alias bspec="bundle exec rspec --color --format documentation"
alias migrate="bundle exec rake db:migrate db:test:prepare"
alias remigrate="bundle exec rake db:drop && rake db:create && rake db:migrate && rake db:schema:dump && rake db:test:prepare"
alias remongrate="bundle exec rake mongoid:migrate mongoid:migrate:redo"

# postgreSQL
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

