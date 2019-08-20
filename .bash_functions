#!/bin/bash

## Update rbenv

update_rbenv () {
  pushd $HOME/.rbenv/plugins/ruby-build/ > /dev/null
  git pull
  popd > /dev/null
}

# terraform functions for webops accounts
function terraform-init (){
  e="$(pwd | rev | cut -d'/' -f 1 | rev)"
  checkIfManagement $e
  if [[ $thisEnvironment == "management" ]]; then 
    e=management
  fi
  echo "terraform init for $e"
  AWS_DEFAULT_PROFILE=webops-$e aws-profile terraform init -upgrade
}

function terraform-plan (){
  e="$(pwd | rev | cut -d'/' -f 1 | rev)"
  checkIfManagement $e
  if [[ $thisEnvironment == "management" ]]; then
    e=management
  fi
  echo "terraform plan for $e"
  AWS_DEFAULT_PROFILE=webops-$e aws-profile terraform plan
}

function terraform-apply (){
  e="$(pwd | rev | cut -d'/' -f 1 | rev)"
  checkIfManagement $e
  if [[ $thisEnvironment == "management" ]]; then
    e=management
  fi
  echo "terraform apply for $e"
  AWS_DEFAULT_PROFILE=webops-$e aws-profile terraform apply
}

function checkIfManagement (){
  unset thisEnvironment
  envs=(integration development qa staging externaltest production)
  for env in "${envs[@]}"; do
    if [[ $env == $1 ]]; then
      thisEnvironment=$env
    fi
  done
  if [ -z ${thisEnvironment+x} ]; then 
    echo 'setting management as environment'
    thisEnvironment=management
  fi
}

