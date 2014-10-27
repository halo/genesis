default[:osx][:settings] += %{

  Subpixel font rendering on non-Apple LCDs -> Enable
  defaults write NSGlobalDomain AppleFontSmoothing -int 2

}
