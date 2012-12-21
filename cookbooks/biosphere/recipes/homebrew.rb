homebrew_path = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')

logg %{Ensuring homebrew...}
git homebrew_path do
  repository 'git://github.com/mxcl/homebrew.git'
  revision node[:biosphere][:homebrew][:revision]
  action :sync
end

brew_executable = File.join(homebrew_path, 'bin', 'brew')

%w{ autoconf mysql imagemagick memcached git redis icu4c pow postgresql rbenv ruby-build }.each do |formula|

  if File.exists?("#{homebrew_path}/Cellar/#{formula}")
    logg(%{Skipping installation of <b>#{formula}</b> via homebrew because it already exists...}) { color :yellow }

  else
    logg %{Installing #{formula} via homebrew...}
    bash "install-#{formula}" do
      code "#{brew_executable} install #{formula}"
    end
  end

end