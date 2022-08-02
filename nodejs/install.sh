#!/bin/bash

asdf plugin add nodejs
asdf nodejs update-nodebuild
asdf install nodejs lts
asdf global nodejs lts
echo "Note: Additional nodejs versions should be managed separately: 'asdf install nodejs <version>'"

# https://www.npmjs.com/package/spoof
# if test ! $(which spoof)
# then
#   if test $(which npm)
#   then
#     sudo npm install spoof -g
#   fi
# fi
