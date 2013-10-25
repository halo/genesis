homebrew_bins_path = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew', 'bin')
rbenv_executable   = File.join(homebrew_bins_path, 'rbenv')
rbenv_root         = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'rbenv')

logg %{Ensuring rbenv root directory...}
directory rbenv_root

version = '1.9.3-p327'

if ::File.directory? "#{rbenv_root}/versions/#{version}/bin"
  logg(%{Skipping installation of Ruby version <b>#{version}</b>, because it already exists.}) { color :yellow }
else
  logg %{Installing rbenv Ruby #{version}...}
  bash "install-ruby" do
    environment({ 'RBENV_ROOT' => rbenv_root })
    code %{export PATH="#{homebrew_bins_path}:$PATH"; eval "$(#{rbenv_executable} init -)" && #{rbenv_executable} install #{version}}
  end
end
