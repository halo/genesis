template_file = Genesis.paths.launch_daemons
                       .join('io.github.halo.genesis.user_key_mapping.plist')

# sudo launchctl load -w /Library/LaunchDaemonsio.github.halo.genesis.user_key_mapping.plist
cookbook_file template_file.to_s do
  owner 'root'
  group 'wheel'
  mode '0644'
end
