#!/bin/bash

set -ev

# Test setup_biicode_project.sh script. Using the example project at test/gituser/gitproject, it should set it up to a biicode block at biiuser/biiproject (because that's the names specified in biicode.conf)
cd test/gituser/gitproject
source ../../../setup_biicode_project.sh
./blocks/biiuser/biiproject/check_biicode_setup.py

