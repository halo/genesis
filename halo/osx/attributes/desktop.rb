default[:osx][:settings] += %{

  Appearance -> Blue
  defaults write NSGlobalDomain AppleAquaColorVariant -int 1

  Appearance -> Use dark menu bar and Dock
  defaults write NSGlobalDomain AppleInterfaceStyle -string Dark
  
  Highlight Color -> Green
  defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431"

  Click in the scroll bar to -> Jump to the spot that's clicked
  defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

  Appearance -> Use dark menu bar and Dock
  defaults write NSGlobalDomain AppleInterfaceStyle -string Dark
  
  Hot Corners -> Top right -> Desktop
  defaults write com.apple.dock wvous-tr-corner -int 4

  Hot Corners -> Top right -> Desktop
  defaults write com.apple.dock wvous-tr-modifier -int 0

  Hot Corners -> Bottom left -> Screen saver
  defaults write com.apple.dock wvous-bl-corner -int 5

  Hot Corners -> Bottom left -> Screen saver
  defaults write com.apple.dock wvous-bl-modifier -int 0

  Hot Corners -> Bottom Right → Mission Control
  defaults write com.apple.dock wvous-br-corner -int 2

  Hot Corners -> Bottom Right → Mission Control
  defaults write com.apple.dock wvous-br-modifier -int 0

}

if %w{ orange blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:osx][:settings] += %{

    Show scroll bars -> When scrolling
    defaults write NSGlobalDomain AppleShowScrollBars -string WhenScrolling

  }
end

if %w{ green }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:osx][:settings] += %{

    System Preferences -> General -> Show Scrollbars -> Always
    defaults write NSGlobalDomain AppleShowScrollBars -string Always

  }
end
