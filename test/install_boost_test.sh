#!/bin/bash

set -ev

# Test install_boost script with some boost libraries
source ./install_boost.sh libboost-filesystem1.55-dev libboost-system1.55-dev
