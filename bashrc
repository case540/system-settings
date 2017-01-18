# Setting PATH for Python 2.7
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:/home/yoland/bin

# Adding alias
alias home="cd ~/Desktop"
alias downloads="cd ~/Downloads"
alias ll="ls -la"
alias la="ls -a"
alias jrnl="~/bin/yo-jrnl"

# Alias g-open to be gnome-open
alias o="gnome-open"

# adding alias for ctag so it execute the exuberant ctags
alias ctags="/usr/local/bin/ctags"

#Hierarchy Viewer Variable 
export ANDROID_HVPROTO=ddm

# Load git prompt.sh
source ~/.git-prompt.sh

# Color LS
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts to my Code folder in my home directory
alias code="cd ~/Journey"

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# Git 
# You must install Git first - ""
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'
alias gch='git checkout' # requires a branch name


### Prompt Colors 
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

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet. 
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="🀄 "

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$ORANGE\]\w\[$WHITE\]\$(__git_ps1 \" (%s)\")\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]> \[$RESET\]"


### Misc

# Only show the current directory's name in the tab 
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z)
. ~/z.sh

# use vi mode in terminal
set -o vi

# add mc as make clean
alias mc="make clean"

### For virtualenv wrapper
#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh
#export PIP_VIRTUALENV_BASE=$WORKON_HOME

export JAVA_HOME=/usr/jdk/jdk1.8.0_73
export PATH=$PATH:$JAVA_HOME

# wunderline shortcut
alias wa="wunderline add"

# default editor is vim!!!
export EDITOR="vi"

# use git autocomplete
source ~/bin/.git-completion.bash

# Add Android tools to PATH
export PATH=$PATH:~/Android/Sdk/platform-tools
export PATH=$PATH:~/Android/Sdk/tools
export PATH=$PATH:~/Android/Sdk/build-tools

# Google appengine path
export PATH=$PATH:~/bin/google_appengine

# Change histfile size
export HISTFILESIZE=100000
