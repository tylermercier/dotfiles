# system related
export PS1="\u@\h: \[\e[32;1m\]\w @ \[\e[36;1m\]\d \t\n\[\e[35;1m\]>>\[\e[0m\] "
export LANG=en_US.UTF-8
export MY_IP=$(/sbin/ifconfig en0 | awk '/inet / { print $2 } ')
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# home folders
export MYSQL_HOME="/usr/local/mysql"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
export JAVA_OPTS="-Xmx1024m -XX:MaxPermSize=512m -Dsun.lang.ClassLoader.allowArraySyntax=true"
export JDK_HOME=$JAVA_HOME
export ANT_HOME="/opt/local/share/java/apache-ant"
export ANT_OPTS="-Xmx1024m -XX:MaxPermSize=512m -Dsun.lang.ClassLoader.allowArraySyntax=true"
export M2_HOME="/opt/local/share/java/maven2"
export CATALINA_HOME="/opt/local/share/java/apache-tomcat-6.0.20"
export CATALINA_BASE=$CATALINA_HOME
export CATALINA_OPTS="-Xmx1024m -XX:MaxPermSize=512m -Dsun.lang.ClassLoader.allowArraySyntax=true"

# path and classpath settings
export PATH=/opt/local/bin:/opt/local/sbin:$MYSQL_HOME/bin:$ANT_HOME/bin:$JAVA_HOME/bin:$M2_HOME/bin:$CATALINA_HOME/bin:$PATH

# local aliases
alias ls='ls -G' #for color
alias ll='ls -alh'
alias grep='grep --color'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias cp='cp -R'
alias myip='echo $MY_IP'
alias rspec='rspec --color --format documentation'

# path aliases
alias code='cd ~/Documents/code'
alias gemsets='ll /Users/Thoughtworks/.rvm/gems'

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"