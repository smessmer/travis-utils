#!/bin/bash
set -ev

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update -qq
if [ "$CXX" = "g++" ]; then sudo apt-get install -qq g++-4.9; fi
if [ "$CXX" = "g++" ]; then export CXX="g++-4.9" CC="gcc-4.9"; fi   
if [ "$CXX" = "g++-4.9" ]; then sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 90; fi

