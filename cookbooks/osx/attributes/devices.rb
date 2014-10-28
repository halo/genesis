default[:osx][:settings] += %{

  Bluetooth headphones/headsets -> Increase quality
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

}

if ENV['SUDO'] && %w{ orange blue green }.include?(ENV['BIOSPHERE_ENV_PROFILE'])
  default[:osx][:settings] += %{

    HDD Sudden motion sensor -> Disable
    sudo pmset -a sms 0

  }
end
