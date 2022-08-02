#!/bin/sh

if [ ! -z "${ASDF_DIR}" ]
then
  asdf plugin add nodejs
  asdf install nodejs lts
  asdf global nodejs lts
  echo "Note: Additional nodejs versions should be managed separately: 'asdf install nodejs <version>'"
else
  echo "Skip installing nodejs until 'ASDF_DIR' is available. Run 'reload!' or open a new terminal window after the remaining installs complete and try again."
fi

# https://www.npmjs.com/package/spoof
# if test ! $(which spoof)
# then
#   if test $(which npm)
#   then
#     sudo npm install spoof -g
#   fi
# fi
