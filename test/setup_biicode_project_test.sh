#!/bin/bash

set -ev

# Test setup_biicode_project.sh script. Using the example project at test/gituser/gitproject, it should set it up to a biicode block at biiuser/biiproject (because that's the names specified in biicode.conf)
cd test/gituser/gitproject
../../../setup_biicode_project.py
./check_biicode_setup.py

