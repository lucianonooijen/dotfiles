#!/usr/bin/env bash
#
# MacOS bootstrapping script
# Luciano Nooijen
#
# Inspiration:
# https://gist.github.com/bradp/bea76b16d3325f5c47d4
# https://gist.github.com/codeinthehole/26b37efa67041e1307db
# https://github.com/fesja/dotfiles/blob/master/.macos
# https://macapps.link
# https://brew.sh
# https://github.com/Homebrew/homebrew-cask-fonts

# Fail on error
set -e

###############################################################################
# Preparation
###############################################################################

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
# sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Installing Rosetta"
softwareupdate --install-rosetta --agree-to-license

###############################################################################
# MacOS configuration
###############################################################################

echo "Configuring OSX..."
# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Set screenshot location
mkdir "$HOME/Desktop/Screenshots" && defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"
# Preventing Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Enabling snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Show hidden files
defaults write http://com.apple.Finder AppleShowAllFiles true
# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# Disable hot corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

killall Finder

###############################################################################
# SSH Key and XCode stuff
###############################################################################


echo "Please create an SSH key using the following command:"
echo "  ssh-keygen -t rsa -b 4096 -C \"yourname@domain.com\""
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install
read -p "Press [Enter] when done..."

###############################################################################
# Installations using Homebrew
###############################################################################

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git via Homebrew..."
brew install git

echo "Please set your Git name and email: "
echo 'git config --global user.name "Name"'
echo 'git config --global user.email name@domain.com'
echo "Press any key when done..."
read _

brews=(
  ack
  ansible
  bat
  bc
  deno
  docker
  docker-compose
  exa
  fd
  ffmpeg
  findutils
  fzf
  go
  gnupg
  helm
  highlight
  htop
  imagemagick
  jq
  k9s
  kubernetes-cli
  lazydocker
  lazygit
  minikube
  neovim
  nmap
  pinentry-mac
  python
  python3
  sc-im
  speedtest_cli
  svn
  terraform
  the_silver_searcher
  thefuck
  tmux
  tree
  wget
  youtube-dl
  zsh
  zsh-syntax-highlighting
)

echo "Installing packages with homebrew..."
brew install ${brews[@]}

casks=(
  1password
  adobe-acrobat-reader
  adobe-creative-cloud
  brave-browser
  discord
  deluge
  firefox
  flux
  jetbrains-toolbox
  keka
  libreoffice
  insomnia
  iterm2
  spotify
  signal
  slack
  sublime-text
  tor-browser
  visual-studio-code
  vlc
  whatsapp
  zoom
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${casks[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
fonts=(
  font-dejavu
  font-dejavu-sans-mono-for-powerline
  font-dejavu-sans-mono-nerd-font
  font-menlo-for-powerline
  font-lato
  font-roboto
  font-clear-sans
)
brew install --cask ${fonts[@]}

echo "Cleaning up Homebrew..."
brew cleanup

###############################################################################
# Installations that require user input
###############################################################################

echo "This might need some attention from you for input:"

echo "Installing NodeJS stuff..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "Installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

###############################################################################
# Finished
###############################################################################

echo "Done!"
echo "Now install the following by hand:"
echo "  - Software using the Jetbrains Toolbox"
echo "  - Software using the Adobe Creative Cloud tool"
echo "  - Postgres.app (https://postgresapp.com/downloads.html)"
echo "  - Your desired NodeJS version using nvm"
echo "  - Logitech Options from logitech.com"
echo "  - Software from the Mac App Store and such"
echo "  - Your custom dotfiles"
echo "But first, restart your computer!"
