#!/bin/sh

# if test ! $(which n)
# then
#   echo " Installing n for node version management."

#   # https://github.com/mklement0/n-install
#   curl -L http://git.io/n-install | bash -s -- -y lts 0.12

# https://www.npmjs.com/package/spoof
if test ! $(which spoof)
then
  sudo npm install spoof -g
fi
