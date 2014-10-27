default[:osx][:settings] += %{

  Crash Reporter -> Disable
  defaults write com.apple.CrashReporter DialogType -string "none"

}
