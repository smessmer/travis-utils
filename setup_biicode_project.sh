#!/bin/bash
set -ev

BUILDFOLDER="travisbuild"
SCRIPT_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Download python script
wget -P "$SCRIPT_DIR" https://raw.githubusercontent.com/smessmer/travis-utils/master/setup_biicode_project.py
chmod +x $SCRIPT_DIR/setup_biicode_project.py

$SCRIPT_DIR/setup_biicode_project.py $BUILDFOLDER
cd ../$BUILDFOLDER
