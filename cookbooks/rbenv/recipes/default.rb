Genesis.users do |account|
  next unless account.orange? || account.green?

  rbenv_root = account.paths.home.join('.rbenv')

  directory rbenv_root.to_s do
    owner account.username
    group 'staff'
  end

  # Set global default ruby version
  file rbenv_root.join('version').to_s do
    content node[:rbenv][:ruby]
    owner account.username
    group 'staff'
  end

  version = node[:rbenv][:ruby]
  ruby_install_dir = rbenv_root.join('versions', version)
  build_executable = Homebrew.bin_path.join('ruby-build')

  execute "install ruby #{version}" do
    command "#{build_executable} #{version} #{ruby_install_dir}"
    creates rbenv_root.join('versions', version, 'bin').to_s
    user account.username
    group 'staff'
    only_if { build_executable.executable? }
  end
end
