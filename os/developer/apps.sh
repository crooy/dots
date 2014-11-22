#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  sublime-text3
  phpstorm
  adobe-creative-cloud
  sequel-pro
  sourcetree
  filezilla
  github
  mamp
  virtualbox
  vagrant
  iterm2
  qlprettypatch
  qlstephen
  quicklook-json
  qlcolorcode
  qlmarkdown
)

# Specify the location of the apps
appdir="/Applications"

main() {

  # install dev specific apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  cleanup
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
