default[:osx][:settings] += %{

  Help Viewer -> Non-floating Windows
  defaults write com.apple.helpviewer DevMode -bool true

}
