# Environment
export ALL_PROXY=proxy.wdf.sap.corp:8080
export HTTP_PROXY=proxy.wdf.sap.corp:8080
export HTTPS_PROXY=proxy.wdf.sap.corp:8080
export NO_PROXY="*.sap.corp,localhost"

export ANT_HOME="/usr/local/apache-ant-1.7.0"
export ANT_OPTS="-Xmx1024m"
export JAVA_OPTS="-Dhttp.proxyHost=proxy.wdf.sap.corp -Dhttp.proxyPort=8080 -Dhttp.nonProxyHosts='*.sap.corp|localhost'"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$ANT_HOME/bin:$PATH"
export MAVEN_OPTS=-Xmx1024m

# homebrew stuff
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Prompt
source ~/.git-completion.sh

alias l="ls -Gl"
alias ll="ls -alG"
alias ls="ls -G"
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gl='git pull --rebase'
alias gp='git push'
alias got='git '
alias get='git '
alias mongo='mongod run --config /usr/local/Cellar/mongodb/2.0.4-x86_64/mongod.conf'

function __git_dirty {
  git diff --quiet HEAD &>/dev/null 
  [ $? == 1 ] && echo "!"
}

function __git_branch {
  __git_ps1 " %s"
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" == "1.8.7" ] && version=""
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full "
}

bash_prompt() {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="$Y\$(__my_rvm_ruby_version)$W\u@$W\h$W:$W\W$Y\$(__git_branch)$R\$(__git_dirty)${NONE} $ "
}

bash_prompt
unset bash_prompt