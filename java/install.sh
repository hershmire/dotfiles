#!/bin/sh

if [ ! -z "${ASDF_DIR}" ]
then
  asdf plugin add java
  echo "Note: Java versions should be managed separately: 'asdf install java <version>'"
else
  echo "Skip installing java until 'ASDF_DIR' is available. Run 'reload!' or open a new terminal window after the remaining installs complete and try again."
fi
