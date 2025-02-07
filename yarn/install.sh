#!/bin/sh

asdf plugin add yarn &&
asdf install yarn latest &&
asdf set yarn latest
echo "Note: Additional yarn versions should be managed separately: 'asdf install yarn <version>'"
