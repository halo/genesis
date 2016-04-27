default[:osx][:settings] += %{

  Developer Tools
  defaults write com.apple.appstore WebKitDeveloperExtras -bool true

  Debug Menu
  defaults write com.apple.appstore ShowDebugMenu -bool true

}
