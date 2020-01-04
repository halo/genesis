githooks_path = Home.path.join '.githooks'

smart_git githooks_path.to_s do
  repository 'https://github.com/halo/githooks.git'
  user Console.user
  group 'staff'
end
