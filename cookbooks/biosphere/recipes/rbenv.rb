require 'pathname'

rbenv_path        = Pathname.new node[:biosphere][:rbenv][:root]
homebrew_bin_path = Pathname.new(node[:biosphere][:homebrew][:root]).join 'bin'
rbenv_executable  = homebrew_bin_path.join('rbenv')

logg %{Ensuring rbenv root directory...}
directory rbenv_path.to_s

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
        environment({ 'RBENV_ROOT' => rbenv_path })
        code %{export PATH="#{homebrew_bin_path}:$PATH"; eval "$(#{rbenv_executable} init -)" && #{rbenv_executable} install #{version}}
      end
    end
  end

end
