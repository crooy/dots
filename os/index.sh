#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"

# Run each program
sh "$os/defaults.sh"
sh "$os/binaries.sh"
sh "$os/apps.sh"

if [ -e "$os/$install/apps.sh" ]; then
	sh "$os/$install/apps.sh"
fi

# Symlink the profile
if [[ ! -e "$HOME/.bash_profile" ]]; then
  echo "symlinking: $os/profile.sh => $HOME/.bash_profile"
  symlink "$os/profile.sh" "$HOME/.bash_profile"
  source $HOME/.bash_profile
else
  echo "$HOME/.bash_profile already exists. remove and run again."
fi
