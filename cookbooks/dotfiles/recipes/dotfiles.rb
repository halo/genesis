dotfiles_path = Home.path.join('.dotfiles')
dotfiles_binary = dotfiles_path.join('bin/dotfiles')
macos_binary = dotfiles_path.join('macos/bin/macos')
frum_path = Pathname.new node[:frum][:root]
frum_executable = Homebrew.bin_path.join('frum')

smart_git dotfiles_path.to_s do
  repository 'https://github.com/halo/dotfiles.git'
  user Console.user
  group 'staff'
end

execute 'run dotfiles' do
  environment(lazy { { frum_ROOT: frum_path.to_s } })
  command %|eval "$(#{frum_executable} init)"; #{dotfiles_binary}|
  user Console.user
  group 'staff'
  only_if { frum_executable.executable? }
end

execute 'run userlevel configuration' do
  environment(lazy { { frum_ROOT: frum_path.to_s } })
  command %|eval "$(#{frum_executable} init)"; #{dotfiles_binary}|
  user Console.user
  group 'staff'
  only_if { frum_executable.executable? }
end

execute 'run root configuration' do
  environment(lazy { { frum_ROOT: frum_path.to_s } })
  command %|eval "$(#{macos_binary} init)"; #{macos_binary} --only-sudo|
  only_if { frum_executable.executable? }
end
