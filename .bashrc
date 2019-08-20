# My main file for loading bash session scripts

# Source .bash_prompt for colours n stuffz
source ~/.bash_prompt

# Source .bash_functions for custom functions
source ~/.bash_functions

# Get aliases
source ~/.bash_aliases

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=20000000

# for history time format
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# to load pyenv on init
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv in path
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# load docker-compose
export PATH="/usr/local/bin/docker-compose:$PATH"

# AWS
AWS_PROFILE=webops-users
export AWS_PROFILE

# add AWS pem file location to environment variable
export MARCUS_PEM=$HOME/.aws/marcus.pem

# terraform
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.tgenv/bin:$PATH"

# test kitchen / packer
export TEST_KITCHEN_USER=marcus.wharton
export TEST_KITCHEN_SSH_KEY=~/.ssh/id_rsa
export PACKER_SSH_USER=marcus.wharton

# add pkenv to path
export PATH="$HOME/.pkenv/bin:$PATH"

# add rustc to path
export PATH="$HOME/.cargo/bin:$PATH"

# add exercism to path
export PATH="$HOME/.exercism:$PATH"

# export java home folder and append to path
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
