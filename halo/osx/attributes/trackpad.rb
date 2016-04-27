default[:osx][:settings] += %{

  System Preferences -> Trackpad -> Tap to click -> No
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

  System Preferences -> Trackpad -> Secondary Click -> Two fingers
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1

}
