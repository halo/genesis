directory = Home.path.join('/Library/LaunchDaemons/')
template_file = directory.join('io.github.halo.genesis.user_key_mapping.plist')

# sudo launchctl load -w /Library/LaunchDaemons/org.custom.keyboard-remap.plist
cookbook_file template_file.to_s do
  owner 'root'
  group 'wheel'
  mode '0644'
end
