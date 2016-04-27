default[:osx][:settings] += %{

  General -> Require password after sleep/saver -> 3 seconds
  defaults write com.apple.screensaver askForPasswordDelay -int 3

  Are you sure you want to open this application? -> Disable
  defaults write com.apple.LaunchServices LSQuarantine -bool false

}
