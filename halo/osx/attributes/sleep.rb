default[:osx][:settings] += %{

  Automatic termination of inactive apps -> Never terminate them
  defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

  Computer sleep mode -> Never
  systemsetup -setcomputersleep Off > /dev/null

}
