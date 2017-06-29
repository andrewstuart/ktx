#!/usr/bin/env bash

# DEFINED IN .bash_profile so you don't have to source this. CURRENT_CLUSTER_FILE=~/.kube/current-cluster

if [ "$#" != 1 ]
then
  echo "Usage: setcluster <cluster-name>"
  exit 1
fi

# If config is not a symlink then likely it actually contains data. Therefore we don't want to "ln -f" it.
if [ ! -L $HOME/.kube/config ]; then
    echo "Your $HOME/.kube/config file needs to be a symbolic link to a configuration file"
    exit 1
fi

# if file doesn't exist bail
if [ -f $1 ]; then
    echo "$HOME/.kube/${1} does not exist."
    exit 1
fi

# TODO: Autocomplete on real files in this dir.
ln -sf ~/.kube/${1} ~/.kube/config
