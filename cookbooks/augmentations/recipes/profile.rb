bash_profile_path  = File.join(ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH'], 'bash_profile')
homebrew_path      = Pathname.new(node[:homebrew][:root])
homebrew_bin_path  = homebrew_path.join 'bin'
homebrew_sbin_path = homebrew_path.join 'sbin'
homebrew_etc_path  = homebrew_path.join 'etc'
rbenv_path         = Pathname.new node[:biosphere][:rbenv][:root]
rbenv_executable   = homebrew_bin_path.join('rbenv')
cask_caskroom_path = Pathname.new node[:cask][:caskroom]
cask_applinks_path = Pathname.new node[:cask][:applinks]

template bash_profile_path do
  source 'bash_profile.erb'
  variables({
    homebrew_bin_path:  homebrew_bin_path,
    homebrew_sbin_path: homebrew_sbin_path,
    homebrew_etc_path:  homebrew_etc_path,
    rbenv_excutable:    rbenv_executable,
    rbenv_root_path:    rbenv_path,
    cask_caskroom_path: cask_caskroom_path,
    cask_applinks_path: cask_applinks_path,
  })
end
