homebrew_path       = Pathname.new node[:biosphere][:homebrew][:root]
homebrew_executable = homebrew_path.join('bin/brew')

caskroom_path = Pathname.new node[:biosphere][:cask][:caskroom]
applinks_path = Pathname.new node[:biosphere][:cask][:applinks]

node[:biosphere][:cask][:apps].each do |app|

  app_path = homebrew_path.join "Cellar/#{app.split.first}"

  if false
    logg(%{Skipping installation of <b>#{app}</b> via homebrew because it already exists.}) { color :yellow }

    if node[:biosphere][:homebrew][:edge_appe].include?(app)
      logg %{Ensuring cutting-edge #{app} via homebrew...}
      bash "upgrade-#{app}" do
        code "#{homebrew_executable} upgrade #{app} || echo 'Probably already up-to-date...' "
      end
    end
  else
    if offline?
      logg(%{Skipping installation of cask <b>#{app}</b> because I'm not online.}) { color :yellow }
    else
      logg %{Installing #{app} via cask...}
      bash "install-cask-#{app}" do
        code "#{homebrew_executable} cask install #{app} --caskroom='#{caskroom_path}' --appdir='#{applinks_path}'"
      end
    end
  end

end
