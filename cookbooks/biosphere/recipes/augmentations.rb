require 'pathname'

# ––––––––––––
# bash_profile
# ––––––––––––

bash_profile_path = File.join(ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH'], 'bash_profile')
homebrew_bin_path = Pathname.new(node[:biosphere][:homebrew][:root]).join 'bin'
rbenv_path        = Pathname.new node[:biosphere][:rbenv][:root]
rbenv_executable  = homebrew_bin_path.join('rbenv')

template bash_profile_path do
  source 'bash_profile.erb'
  variables({
    :homebrew_bin_path => homebrew_bin_path,
    :rbenv_excutable   => rbenv_executable,
    :rbenv_root_path   => rbenv_path,
  })
end

# –––––––––––
# .ssh/config
# –––––––––––

ssh_config_path   = File.join(ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH'], 'ssh_config')

file ssh_config_path do
  content '# This came from cortana'
end
