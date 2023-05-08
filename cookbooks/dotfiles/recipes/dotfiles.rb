dotfiles_path = Home.path.join('.dotfiles')
dotfiles_binary = dotfiles_path.join('bin/dotfiles')
macos_binary = dotfiles_path.join('macos/bin/macos')
rbenv_path = Pathname.new node[:rbenv][:root]
rbenv_executable = Homebrew.bin_path.join('rbenv')

smart_git dotfiles_path.to_s do
  repository 'https://github.com/halo/dotfiles.git'
  user Console.user
  group 'staff'
end

execute 'run dotfiles' do
  environment(lazy { { rbenv_ROOT: rbenv_path.to_s } })
  command %|eval "$(#{rbenv_executable} init)"; #{dotfiles_binary}|
  user Console.user
  group 'staff'
  only_if { rbenv_executable.executable? }
end

execute 'run userlevel configuration' do
  environment(lazy { { rbenv_ROOT: rbenv_path.to_s } })
  command %|eval "$(#{rbenv_executable} init)"; #{dotfiles_binary}|
  user Console.user
  group 'staff'
  only_if { rbenv_executable.executable? }
end

execute 'run root configuration' do
  environment(lazy { { rbenv_ROOT: rbenv_path.to_s } })
  command %|eval "$(#{rbenv_executable} init)"; #{macos_binary} --only-sudo|
  only_if { rbenv_executable.executable? }
end
