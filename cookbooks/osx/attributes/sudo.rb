if ENV['SUDO']
  default[:osx][:settings] += %{

    Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "

    HDD Sudden motion sensor -> Disable
    sudo pmset -a sms 0

    Show HiDPI display modes in screen resolution settings pane (requires restart)
    sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

  }
end
