Homebrew.node = node

shell_path       = Biosphere.augmentations_path.join 'shell'
rbenv_root_path  = Pathname.new node[:rbenv][:root]
rbenv_executable = Homebrew.bin_path.join('rbenv')

template shell_path.to_s do
  source 'shell.erb'
  variables(
    homebrew_bin_path:  Homebrew.bin_path,
    homebrew_sbin_path: Homebrew.sbin_path,
    homebrew_etc_path:  Homebrew.etc_path,
    rbenv_excutable:    rbenv_executable,
    rbenv_root_path:    rbenv_root_path
  )
end
