# Path to your oh-my-zsh installation.
export ZSH=/Users/lucasch/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/Users/lucasch/Library/Enthought/Canopy_64bit/User/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/share/smlnj/bin/:/usr/bin/android-studio/bin/studio.sh:/Users/lucasch/workspace/openSource/chrome_stuff/depot_tools:/Users/lucasch/bin:/usr/local/bin:/usr/local/Cellar/mtr/0.86/sbin/:$GOBIN"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


###########ALIASES####################
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
#export GOPATH=$HOME/workspace/project-2-cloud-fusion-mrlucasch
export GOPATH=/Users/lucasch/workspace/bazaar
export GOPATH=/Users/lucasch/workspace/trading_post
export GOPATH=/Users/lucasch/workspace/iterate-octo-funicular
export GOBIN=$GOPATH/bin
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
alias pdflatex="docker run --rm -it -v $PWD:/data jsalvarredy/latex /bin/bash"


####DOCKER HUB#####
alias docker-init="source /Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"

alias bazaar1="python bazaar.py -p 5555 -i peer2 -r 0 -f peers2"
alias bazaar2="python bazaar.py -p 1234 -i peer1 -f peers2"
alias proxy="ssh -D12345 obelix"

alias mnt_ob='mkdir /Volumes/obelix && sshfs -o reconnect -o volname=Obelix_export  -o allow_other,default_permissions obelix:/nfs/obelix/users1/lucasch/export /Volumes/obelix'
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.5.1
export PATH=$PATH:$EC2_HOME/bin 
export EC2_CERT=$EC2_HOME/group_34_cert.pem
#export EC2_PRIVATE_KEY=$EC2_HOME/group_34_pk.pem
export EC2_PRIVATE_KEY=$EC2_HOME/group34_pk_pkcs8.pem
export AWS_ACCESS_KEY=AKIAIZYSC6MF4XVN3EAQ
export AWS_SECRET_KEY=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

##CLOUDWATCH
export EC2_BASE=/usr/local/ec2
export AWS_CLOUDWATCH_HOME=$EC2_BASE/cloudWatch
export PATH=$PATH:$AWS_CLOUDWATCH_HOME/bin
export PATH=$PATH:/usr/local/go/bin/
