Genesis.users do |account|
  smart_git account.paths.home.join('.dotfiles').to_s do
    repository 'https://github.com/halo/dotfiles.git'
    user account.username
    group 'staff'
  end
end
