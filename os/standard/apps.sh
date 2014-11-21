#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
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
