default[:osx][:settings] += %{

  Bluetooth headphones/headsets -> Increase quality
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

}
