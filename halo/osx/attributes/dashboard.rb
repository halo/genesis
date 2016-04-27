default[:osx][:settings] += %{

  Disable Dashboard
  defaults write com.apple.dashboard mcx-disabled -bool true

  Don’t show Dashboard as a Space
  defaults write com.apple.dock dashboard-in-overlay -bool true

  Dev mode (allows keeping widgets on the desktop)
  defaults write com.apple.dashboard devmode -bool true

}
