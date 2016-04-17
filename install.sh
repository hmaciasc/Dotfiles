#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")"

# Install Homebrew on OS X
read -p "Would you like to set up Homebrew? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./brew.sh
    source osxdefaults.sh
fi

read -p "Would you like to set up OS X preferences? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./osx.sh
fi

# Install npm packages
if which npm > /dev/null; then
	read -p "Would you like to install npm packages? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		./npm.sh
	fi
fi
