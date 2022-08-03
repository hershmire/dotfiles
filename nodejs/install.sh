#!/bin/bash

asdf plugin add nodejs
asdf nodejs update-nodebuild
asdf install nodejs lts
asdf global nodejs lts
echo "Note: Additional nodejs versions should be managed separately: 'asdf install nodejs <version>'"
