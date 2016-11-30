#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/Documents/go/bin:$PATH"

# Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Configure go
export GOPATH=$HOME/Documents/go
export GO15VENDOREXPERIMENT=1

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

# Disable lint hook
export NO_AUTOAUTOLINT=0

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