# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n$(date +"%r")$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lll='ls -FGlAhp'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PATH=$PATH:/usr/share/smlnj/bin/
export PATH=$PATH:/usr/bin/android-studio/bin/studio.sh

#aliases
alias android="/usr/bin/android-studio/bin/studio.sh"
#alias top="htop"
alias nimbus="ssh lucasch@nimbus.seas.gwu.edu"
alias ec2="ssh -i ~/Documents/lucasch.pem ubuntu@ec2-54-224-129-239.compute-1.amazonaws.com"
alias shell="ssh lucasch@shell.seas.gwu.edu"
alias install="sudo apt-get -y install"
alias remove="sudo apt-get -y remove"

#variables
#redhat=128.164.157.34
#server=128.164.159.250

alias deploy="rake gen_deploy"
alias rake="bundle exec rake"
#alias vmware="sudo vmware "
export PATH=$PATH:~/workspace/openSource/chrome_stuff/depot_tools
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/bin
#alias compile="ninja -C out/Debug chrome"
alias ipython="/Users/lucasch/Library/Enthought/Canopy_64bit/User/bin/ipython notebook"
#alias em="/Applications/Emacs.app/Contents/MacOS/Emacs"
#alias transfer="/Users/lucasch/workspace/SD/./sync.sh"
alias go="/usr/local/go/bin/go"
export PATH=$PATH:/usr/local/Cellar/mtr/0.86/sbin/
#export GOPATH=$HOME/workspace
export GOPATH=$HOME/workspace/project-2-cloud-fusion-mrlucasch
alias serve="python -m SimpleHTTPServer 8000"
alias emacs="open -a /Applications/Emacs.app"

#runs Z
. ~/workspace/z/z.sh

export EDITOR=/usr/bin/vim
#export BLOCKSIZE=1k
alias f='open -a Finder ./'
ql () { qlmanage -p "$*" >& /dev/null; }
trash () { command mv "$@" ~/.Trash ; } 

#For Canopy
VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/lucasch/Library/Enthought/Canopy_64bit/User/bin/activate

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   ---------------------------
#   6.  NETWORKING
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets

alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias mnt_ob='sshfs -o reconnect -o volname=Obelix_export  -o allow_other obelix:/nfs/obelix/users1/lucasch/export /Volumes/obelix'
