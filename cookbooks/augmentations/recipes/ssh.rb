ssh_path = Home.path.join '.ssh'

logg %{Ensuring .ssh directory...}
directory ssh_path.to_s do
  mode '0700'
end

logg %{Ensuring .ssh config file...}
file ssh_path.join('config').to_s do
  mode '0600'
  action :touch
end

# –––––––––––
# .ssh/config
# –––––––––––

ssh_config_path     = File.join(ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH'], 'ssh_config')
github_key_filename = ENV['BIOSPHERE_ENV_GITHUB_SSH_KEY_NAME'] || ENV['BIOSPHERE_ENV_SSH_KEY_NAME'] || 'id_rsa'
chef_key_filename   = ENV['BIOSPHERE_ENV_CHEF_SSH_KEY_NAME']   || ENV['BIOSPHERE_ENV_SSH_KEY_NAME'] || 'id_rsa'

unless github_key_filename
  logg(%{I'm not using a custom SSH key for #{Github.host} because you have not set that flag...}) { color :yellow }
else

  logg %{Creating ssh augmentations for using the custom key <b>#{github_key_filename}</b> for accessing #{Github.host}...}
  template ssh_config_path do
    source 'ssh_config.erb'
    variables({
      github_key_path: Home.path.join('.ssh', github_key_filename),
      chef_key_path:   Home.path.join('.ssh', chef_key_filename),
    })
  end
end
