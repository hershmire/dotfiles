#!/bin/sh

if ! [[ -n "$(asdf plugin list | grep yarn)" ]]; then
  echo "Installing yarn plugin..."
  asdf plugin add yarn
else
  echo "Updating yarn plugin..."
  asdf plugin update yarn
fi

asdf install yarn latest &&
asdf set -u yarn latest
