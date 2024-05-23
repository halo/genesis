Genesis.users do |account|

  dotfiles_path = account.paths.home.join('.dotfiles')
  dotfiles_binary = dotfiles_path.join('bin/dotfiles')
  macos_binary = dotfiles_path.join('macos/bin/macos')
  rbenv_path = Pathname.new node[:rbenv][:root]
  rbenv_executable = Homebrew.bin_path.join('rbenv')
  ruby_version = node[:rbenv][:ruby]
  rbenv_init = %|eval "$(#{rbenv_executable} init - zsh)"; rbenv shell #{ruby_version}|

  execute 'run dotfiles' do
    environment(lazy { { rbenv_ROOT: rbenv_path.to_s } })
    command %(#{rbenv_init}; #{dotfiles_binary})
    user account.username
    group 'staff'
    only_if { rbenv_executable.executable? }
  end

  execute 'run userlevel configuration' do
    environment(lazy { { rbenv_ROOT: rbenv_path.to_s } })
    command %(#{rbenv_init}; #{dotfiles_binary})
    user account.username
    group 'staff'
    only_if { rbenv_executable.executable? }
  end

  execute 'run root configuration' do
    environment(lazy { { rbenv_ROOT: rbenv_path.to_s } })
    command %(#{rbenv_init}; #{macos_binary} --only-sudo)
    only_if { rbenv_executable.executable? }
  end
end
