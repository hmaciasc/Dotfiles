#!/bin/bash

# Make sure homebrew is installed first
if [[ ! "$(type -P brew)" ]]; then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew update

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

brew install zsh
chsh -s /usr/local/bin/zsh
.zshrc >> ~/.zssrc

brew install bash-completion
brew install node
brew install git
brew install wget
brew install gh
brew install httpie
brew install imagemagick
brew install python
brew install z
brew install tree

brew cask install atom
brew cask install firefox
brew cask install google-chrome
brew cask install spotify
brew cask install virtualbox
brew cask install vlc
brew cask install alfred
brew cask install dash
brew cleanup
