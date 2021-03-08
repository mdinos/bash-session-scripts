#!/bin/bash

alias ls="ls --color=always"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export SENDAT_HOME=/home/marcus/git/me/sensors-data
alias sendat='${SENDAT_HOME}/sendat.py'

alias await=await

await () {
  attempts=0
  rc=1
  while [[ $rc != 0 ]];
  do 
    echo "Trying to execute \"${@}\", ${attempts} attempts so far."
    $@
    rc=$?
    attempts=$(expr $attempts + 1)
    sleep 1
  done
  echo "Return code ${rc} from ${@}, exiting."
}
