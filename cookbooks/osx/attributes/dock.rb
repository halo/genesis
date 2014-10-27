default[:osx][:settings] += %{

  Dock Icon Size
  defaults write com.apple.dock tilesize -int 27

  Don't minimize windows into their icon, place them to the right
  defaults write com.apple.dock minimize-to-application -bool false

  Enable spring loading for all Dock items
  defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

  Show indicator lights for open applications in the Dock
  defaults write com.apple.dock show-process-indicators -bool true

  Don’t animate opening applications from the Dock
  defaults write com.apple.dock launchanim -bool false

  Remove the auto-hiding Dock delay
  defaults write com.apple.dock autohide-delay -float 0

  Remove the animation when hiding/showing the Dock
  defaults write com.apple.dock autohide-time-modifier -float 0

  Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  Make Dock icons of hidden applications translucent
  defaults write com.apple.dock showhidden -bool true

}
