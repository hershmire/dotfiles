#!/bin/sh

if [ ! -z "${ASDF_DIR}" ]
then
  asdf plugin add yarn
  asdf install yarn latest
  echo "Note: Additional yarn versions should be managed separately: 'asdf install yarn <version>'"
else
  echo "Skip installing yarn until 'ASDF_DIR' is available. Run 'reload!' or open a new terminal window and try again."
fi
