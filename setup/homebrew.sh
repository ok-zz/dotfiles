#!/bin/bash
# Simple installer for homebrew
# via http://mxcl.github.com/homebrew/

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

#Install some basic tools
brew install git
brew install autojump

# Install Homebrew Cask (https://github.com/phinze/homebrew-cask)
brew tap phinze/homebrew-cask
brew install brew-cask

# Install some QuickLook plugins
# via https://github.com/sindresorhus/quick-look-plugins
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install betterzipql
