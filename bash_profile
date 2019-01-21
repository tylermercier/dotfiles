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

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/tylermercier/.kube/config:/Users/tylermercier/.kube/config.shopify.cloudplatform
for file in /Users/tylermercier/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done

# Load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
else
  . /usr/local/etc/bash_completion
fi

# Enable dev
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/lib/google-cloud-sdk/path.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then source '/usr/local/lib/google-cloud-sdk/completion.bash.inc'; fi
