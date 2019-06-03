#!/usr/bin/env bash

if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
  echo "XCode tools not found. Installing..."
  xcode-select --install
fi

if [[ $(command -v brew) == "" ]]; then 
		echo "Installing Homebrew.. "
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Setting up Homebrew..."
curl <INSERT_RAW_LINK_HERE> -o $HOME/Brewfile
brew bundle
rm -fr $HOME/Brewfile
echo "Homebrew is ready!"