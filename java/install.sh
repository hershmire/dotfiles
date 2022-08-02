#!/bin/sh

if [ ! -z "${ASDF_DIR}" ]
then
  asdf plugin add java
  echo "Note: No default Java version set. Manage this with asdf: 'asdf install java <version>'"
else
  echo "Java versions are managed by 'asdf' and is missing 'ASDF_DIR' env var. No default version are set with this install script."
fi
