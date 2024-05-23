Genesis.users do |account|
  smart_git account.paths.home.join('.githooks').to_s do
    repository 'https://github.com/halo/githooks.git'
    user account.username
    group 'staff'
  end
end
