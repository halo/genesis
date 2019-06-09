dotfiles_path = Home.path.join('.dotfiles')
#dotfiles_binary = dotfiles_path.join('bin/dotfiles')

git dotfiles_path.to_s do
  repository 'https://github.com/halo/dotfiles.git'
  action :sync
  revision 'master'
  user Console.user
  group 'staff'
  only_if { Internet.online? }
end

# TODO: Run dotfiles
