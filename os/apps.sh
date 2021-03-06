#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  jumpcut
  sourcetree
  vlc
  iterm2
  caffeine
  bartender
  sequel-pro
  jitouch
  skype
  controlplane
  sublime-text
  flux
  google-drive
  authy-bluetooth
  appcleaner
  adobe-air
  spotify
  flash
  steam
  dropbox
  evernote
  slack
  firefox
  google-chrome
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  brew tap phinze/homebrew-cask
  brew install brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  
  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}


cleanup() {
  brew cleanup
}

main "$@"
exit 0
