default[:osx][:settings] += %{

  Debug Menu
  defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

  Advanced Options
  defaults write com.apple.DiskUtility advanced-image-options -bool true

}
