log %{Installing homebrew ...}
repo_path = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
git repo_path do
  repository 'git://github.com/mxcl/homebrew.git'
  revision node[:biosphere][:homebrew][:revision]
  action :sync
end
