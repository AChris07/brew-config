#!/usr/bin/env bash

BREWFILE_URL=https://raw.githubusercontent.com/AChris07/brew-config/master/Brewfile
BREWFILE_NAME=$HOME/Brewfile

if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
  echo "XCode tools not found. Installing..."
  xcode-select --install
fi

if [ $(command -v brew &> /dev/null; printf $?) -ne 0 ]; then
  echo "Installing Homebrew.. "
  bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if [ $(command -v curl &> /dev/null; printf $?) -ne 0 ]; then
  HOMEBREW_SETUP=`curl $BREWFILE_URL -o $BREWFILE_NAME`
elif [ $(command -v wget &> /dev/null; printf $?) -ne 0 ]; then
  HOMEBREW_SETUP=`wget $BREWFILE_URL -O $BREWFILE_NAME`
else
  echo "Could not find curl or wget. Please install one of these and try again. Aborting..." 1>&2
  exit 128
fi

echo "Setting up Homebrew..."
eval $HOMEBREW_SETUP
brew bundle
rm -fr $HOME/Brewfile
echo "Homebrew is ready!"
