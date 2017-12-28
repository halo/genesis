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

ssh_config_path         = Biosphere.augmentations_path.join 'ssh_config'
github_key_filename     = ENV['BIOSPHERE_ENV_GITHUB_SSH_KEY_NAME']     || ENV['BIOSPHERE_ENV_SSH_KEY_NAME'] || 'id_rsa'
serverpark_key_filename = ENV['BIOSPHERE_ENV_SERVERPARK_SSH_KEY_NAME'] || ENV['BIOSPHERE_ENV_SSH_KEY_NAME'] || 'id_rsa'

logg %{Creating SSH augmentations...}
template ssh_config_path do
  source 'ssh_config.erb'
  variables(
    github_key_path: Home.path.join('.ssh', github_key_filename),
    serverpark_key_path:   Home.path.join('.ssh', serverpark_key_filename),
  )
end
