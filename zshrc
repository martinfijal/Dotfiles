# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="terminalparty"

### ALIASES ----------------------------------------------------

alias e='vim'

alias ll='ls -la'
alias l='ls -lha'

alias cls='clear'

alias clog='cd /var/log'
alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'

alias mv='mv -i'
alias rm='rm -i'

alias py='python'

alias g='git'
alias gs='git stash'
alias gp='git stash pop'

alias psg='ps aux | grep -v "grep --color=auto" | grep '


alias linose="nosetests --with-coverage --cover-package loadimpact -s "

### ENVIRONMENT VARIABLES  ------------------------------------

export EDITOR='vim'
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH"
export GREP_OPTIONS='--color=auto'
export HISTCONTROL=erasedups

export GIT_PAGER="less -R"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/root/bin:/usr/local/bin:/root/bin:/usr/local/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/bin:/root/bin:/root/go/bin:/root/go/bin:/root/go/bin:/root/go/bin
