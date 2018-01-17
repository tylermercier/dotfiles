#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Configure go
export GOPATH=$HOME

export PATH="/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH"

# Ansi Colors in iTerm2
export CLICOLOR=1

# Default to vim as editor
export EDITOR=vim

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Configure NPM
export NODE_PATH=/usr/local/lib/node
export ANDROID_HOME=/usr/local/opt/android-sdk
export HDFS_USER=tylermercier
export HADOOP_CONF_DIR=/Users/tylermercier/Documents/github/shopify/starscream/.cache/spark/current/conf/conf.cloudera.yarn
export PYTHON_ENV=remote_development

# Load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# add ssh profiles
ssh-add -A

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
