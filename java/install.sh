#!/bin/sh

if ! [[ -n "$(asdf plugin list | grep java)" ]]; then
  echo "Installing java plugin..."
  asdf plugin add java
  echo "Manage java versions with asdf: 'asdf install java <version>'"
fi

echo "Testing"
asdf install java latest:openjdk-24
asdf set -u java latest:openjdk-24
echo "Global java set to latest:openjdk-24. Any additional versions should be managed via 'asdf install java <version>'."
