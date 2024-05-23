Genesis.users do |account|
  next unless account.orange? || account.green?

  rbenv_path = account.paths.home.join('.rbenv')
  rbenv_executable = Homebrew.bin_path.join('rbenv')

  directory rbenv_path.to_s do
    owner account.username
    group 'staff'
  end

  # Set global default ruby version
  file rbenv_path.join('version').to_s do
    content node[:rbenv][:ruby]
    owner account.username
    group 'staff'
  end

  version = node[:rbenv][:ruby]
  execute "install ruby #{version}" do
    environment(lazy { { rbenv_ROOT: rbenv_path.to_s } })
    cwd account.paths.home.to_s
    # For the flags, see https://github.com/rbenv/rbenv/issues/121#issuecomment-1256316458
    command "#{rbenv_executable} install -s #{version}"
    creates rbenv_path.join('versions', version, 'bin').to_s
    user account.username
    group 'staff'
    only_if { rbenv_executable.executable? }
    not_if { shell_out("#{Homebrew.bin_path.join('rbenv')} versions", user: account.username).stdout.include?(version) }
  end
end
