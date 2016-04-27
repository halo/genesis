Homebrew.node = node

bash_profile_path  = File.join(ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH'], 'bash_profile')
rbenv_path         = Pathname.new node[:biosphere][:rbenv][:root]
rbenv_executable   = Homebrew.bin_path.join('rbenv')
cask_caskroom_path = Pathname.new node[:cask][:caskroom]
cask_applinks_path = Pathname.new node[:cask][:applinks]

template bash_profile_path do
  source 'bash_profile.erb'
  variables({
    homebrew_bin_path:  Homebrew.bin_path,
    homebrew_sbin_path: Homebrew.sbin_path,
    homebrew_etc_path:  Homebrew.etc_path,
    rbenv_excutable:    rbenv_executable,
    rbenv_root_path:    rbenv_path,
    cask_caskroom_path: cask_caskroom_path,
    cask_applinks_path: cask_applinks_path,
  })
end
