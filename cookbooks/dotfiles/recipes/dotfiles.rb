dotfiles_path = Home.path.join('.dotfiles')

smart_git dotfiles_path.to_s do
  repository 'https://github.com/halo/dotfiles.git'
  user Console.user
  group 'staff'
end
