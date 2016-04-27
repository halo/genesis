default[:osx][:settings] += %{

  Subpixel font rendering on non-Apple LCDs -> Enable
  defaults write NSGlobalDomain AppleFontSmoothing -int 2

}

if ENV['SUDO']
  default[:osx][:settings] += %{

    Show HiDPI display modes in screen resolution settings pane (requires restart)
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

  }
end
