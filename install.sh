#!/bin/sh

echo "This will install the libraries needed to build and publish your website from this computer."
echo "Buckle up, it may take a while."

# Prerequisites

# OSX

# install brew
echo "This will install HOMEBREW : an \"appstore\" of the various development tools for OSX computers"
echo "This installer will fetch most of the tools it will need from here"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install RVM
echo "This will install RVM : an environment manager for Ruby projects."
echo "It will isolate the tools and libraries installed, and help prevent conflicts with your existing software."


# Install the dependencies for this website
bundle install

# A reasonably new version of git
brew install git

# Git-LFS to manage binary files and images
brew install git-lfs
git lfs install

# Install git hooks
echo "This will tell GIT to run \"hooks\" when you publish your site, protecting you from messing up in some common ways"
