#!/bin/bash

set -ev

# Install biicode
wget http://apt.biicode.com/install.sh
chmod +x install.sh
./install.sh
rm install.sh
echo "Installed biicode version: "$(bii --version)
bii setup:cpp

# Init project
bii init -l
bii find

# unset options from above, in case this script is called with "source"
set +v
