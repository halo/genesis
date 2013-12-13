
bash 'System Preferences -> General -> Appearance -> Blue' do
  code %{defaults write NSGlobalDomain AppleAquaColorVariant -int 1}
end
