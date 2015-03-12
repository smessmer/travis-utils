#!/bin/bash

set -e

# Install biicode
wget http://apt.biicode.com/install.sh
chmod +x install.sh
./install.sh
rm install.sh
bii setup:cpp

# Init project
bii init -l
bii find
