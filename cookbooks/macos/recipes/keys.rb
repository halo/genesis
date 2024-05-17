template_file = Genesis.paths.launch_daemons
                       .join('io.github.halo.genesis.user_key_mapping.plist')

# sudo launchctl load -w /Library/LaunchDaemons/io.github.halo.genesis.user_key_mapping.plist
# sudo launchctl unload /Library/LaunchDaemons/io.github.halo.genesis.user_key_mapping.plist

if Genesis.users.any?(&:opinionated?)
  cookbook_file template_file.to_s do
    owner 'root'
    group 'wheel'
    mode '0644'
  end
end
