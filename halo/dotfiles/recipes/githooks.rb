logg %(Ensuring githooks...)

git Home.path.join('.githooks').to_s do
  repository 'https://github.com/halo/githooks.git'
  action :sync
  only_if { online? }
end
