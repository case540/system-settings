### Yoland's personalization
set -o vi
export PATH=$PATH:/home/yoland/bin

# For Android development
export PATH=$PATH:/home/yoland/Android/Sdk/tools
export PATH=$PATH:/home/yoland/Android/Sdk/platform-tools

# Add google_appengine dir to PATH
export PATH=$PATH:/home/yoland/bin/google_appengine/

export EDITOR="vim"

# Random shit
alias code="cd ~/Code"
alias gitfile="git log --name-only"
alias gitlast="git log --name-only -p -1"
alias gitlastfile="git log --name-only -p -1 --pretty=format:"
alias gitshush="git add -u && git commit -a --amend --no-edit"
alias gitupdate="git add -u && git commit -m update"
alias gitlp="git log -p"
alias gitback="git checkout -"
alias gitgo="git checkout"
alias gg="git checkout"

export PROMPT_COMMAND="history -a; history -n"

# Set up bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
      . /etc/bash_completion
fi

# Alias wa to be `wunderline add`
alias spotify="spotify --force-device-scale-factor=2"

# Wrapper for jrnl
alias jrnl="/home/yoland/bin/yo-jrnl"

# Load git-prompt.sh
source /home/yoland/.bash-git-prompt/gitprompt.sh

# Fuck alias
eval $(thefuck --alias)

# Java path switch
function setup_jdk() {
  # Remove the current JDK from PATH
  if [ -n "$JAVA_HOME" ] ; then
    PATH=${PATH/$JAVA_HOME\/bin:/}
  fi
  export JAVA_HOME=$1
  export PATH=$JAVA_HOME/bin:$PATH
}

function use_java8() {
  setup_jdk /usr/local/buildtools/java/jdk
}

function use_java7() {
  setup_jdk /usr/local/buildtools/java/jdk7-google-v5-64/
}

# Set the default
use_java8

# Add the internal Android SDK to your PATH
export SDK_LOC=/google/data/ro/teams/as-with-blaze/android-sdk-linux
export PATH=${PATH}:${SDK_LOC}/tools:${SDK_LOC}/platform-tools

# Set up alias for ipython
alias ipython="/usr/local/bin/ipython2"
alias ipython3="/usr/local/bin/ipython"

### End of Yoland's personalization

### Aliases

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='subl'
alias o='gnome-open'

# Color LS
colorflag="--color -G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Git
# You must install Git first
alias gs='git status'
alias ga='git add .'
alias grm='git rm $(git ls-files --deleted)'

### Prompt Colors
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    BLACK=$(tput setaf 190)
    MAGENTA=$(tput setaf 9)
    ORANGE=$(tput setaf 172)
    GREEN=$(tput setaf 190)
    PURPLE=$(tput setaf 141)
    WHITE=$(tput setaf 0)
  else
    BLACK=$(tput setaf 190)
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  BLACK="\033[01;30m"
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="☭ "

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$ORANGE\]\w\[$WHITE\]\$(__git_ps1 \" (%s)\")\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z)
. ~/z.sh
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

# Add man page coloring
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# added by Anaconda3 4.2.0 installer
export PATH="$PATH:/home/yoland/anaconda3/bin"

# HISTFILESIZE
export HISTFILESIZE=10000
