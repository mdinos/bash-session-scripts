#!/bin/bash

alias ls="ls --color=always"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export SENDAT_HOME=/home/marcus/git/me/sensors-data
alias sendat='${SENDAT_HOME}/sendat.py'

alias await=await

await() {
  $@
  attempts=0
  while [[ $? -ne 0 ]];
  do 
    $@
    attempts=$(expr $attempts + 1)
    echo "Trying to execute $@, $attempts attempts so far."
    sleep 1
  done
}
