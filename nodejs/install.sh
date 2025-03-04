#!/bin/bash

if ! [[ -n "$(asdf plugin list | grep nodejs)" ]]; then
  echo "Installing nodejs plugin..."
  asdf plugin add nodejs
else
  echo "Updating nodejs plugin..."
  asdf plugin update nodejs
fi

latestInstalledLTS=$(asdf cmd nodejs resolve lts --latest-installed | head -n 1)
latestAvailableLTS=$(asdf cmd nodejs resolve lts --latest-available | head -n 1)

echo "Latest installed LTS: $latestInstalledLTS"
echo "Latest available LTS: $latestAvailableLTS"

if [[ "$latestInstalledLTS" == "$latestAvailableLTS" ]]; then
  echo "Latest nodejs LTS is already installed"
else
  echo "Installing nodejs version $latestAvailableLTS..."
  asdf install nodejs $latestAvailableLTS
fi

asdf set -u nodejs $latestAvailableLTS
echo "Global nodejs set to $latestAvailableLTS. Any additional versions should be managed via 'asdf install nodejs <version>'."

# https://www.npmjs.com/package/spoof
if test ! $(which spoof)
then
  if test $(which npm)
  then
    npm install spoof -g
  fi
fi
