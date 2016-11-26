require 'pathname'

rbenv_path        = Pathname.new node[:biosphere][:rbenv][:root]
homebrew_bin_path = Pathname.new(node[:homebrew][:root]).join 'bin'
rbenv_executable  = homebrew_bin_path.join('rbenv')
homebrew_executable = homebrew_bin_path.join('brew')

logg %{Ensuring rbenv root directory...}
directory rbenv_path.to_s

logg %{Ensuring rbenv version config file}
file rbenv_path.join('version').to_s do
  content node[:biosphere][:rbenv][:rubies].first
end

node[:biosphere][:rbenv][:rubies].each do |version|

  ruby_bin_path = rbenv_path.join('versions', version, 'bin')

  if ruby_bin_path.directory?
    logg(%{Skipping installation of Ruby version <b>#{version}</b>, because it already exists.}) { color :yellow }
  else

    unless rbenv_executable.executable?
      logg(%{Skipping installation of Ruby version <b>#{version}</b>, because rbenv seems not to be installed.}) { color :yellow }
    else
      logg %{Installing rbenv Ruby #{version}...}
      bash "install-ruby" do
        cwd Home.path.to_s
        environment({ 'RBENV_ROOT' => rbenv_path.to_s })
        code %{eval "$(#{rbenv_executable} init -)" && #{rbenv_executable} install #{version}}
      end
    end
  end

end
