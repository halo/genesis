default[:osx][:settings] += %{

  Automatically rearrange Spaces -> No
  defaults write com.apple.dock mru-spaces -bool false

  Speed up Mission Control animations
  defaults write com.apple.dock expose-animation-duration -float 0.1

  Don’t group windows by application in Mission Control
  defaults write com.apple.dock expose-group-by-app -bool false

}
