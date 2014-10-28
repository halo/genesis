default[:osx][:settings] += %{
  
  Battery -> Show Percentage -> Yes
  defaults write com.apple.menuextra.battery ShowPercent -string "YES"

  Clock -> Format
  defaults write com.apple.menuextra.clock DateFormat "EEE d. MMM  HH:mm"

  Choose which Icons to show
  defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/VPN.menu" "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

  VPN -> Show connected time
  defaults write com.apple.networkConnect VPNShowTime -int 1

  VPN -> Show when connecting
  defaults write com.apple.networkConnect VPNShowStatus -int 1

}

if %w{ orange blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:osx][:settings] += %{

    Hide Spotlight Menu Item
    sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

  }
end
