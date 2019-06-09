githooks_path = Home.path.join '.githooks'

git githooks_path.to_s do
  repository 'https://github.com/halo/githooks.git'
  action :sync
  revision 'master'
  user Console.user
  group 'staff'
  only_if { Internet.online? }
end
