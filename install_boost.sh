#!/bin/bash
set -ev

sudo apt-add-repository -y ppa:boost-latest/ppa
sudo apt-get update -qq
sudo apt-get install -qq $@

# unset verbose option from above, in case this script is called with "source"
set +v
