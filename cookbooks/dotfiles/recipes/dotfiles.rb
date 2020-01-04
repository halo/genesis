dotfiles_path = Home.path.join('.dotfiles')
dotfiles_binary = dotfiles_path.join('bin', 'dotfiles')
macos_binary = dotfiles_path.join('macos', 'bin', 'macos')

smart_git dotfiles_path.to_s do
  repository 'https://github.com/halo/dotfiles.git'
  user Console.user
  group 'staff'
end

execute 'run dotfiles' do
  command dotfiles_binary.to_s
  user Console.user
  group 'staff'
end

execute 'run userlevel configuration' do
  command macos_binary.to_s
  user Console.user
  group 'staff'
end

execute 'run root configuration' do
  command "#{macos_binary} --only-sudo"
end
