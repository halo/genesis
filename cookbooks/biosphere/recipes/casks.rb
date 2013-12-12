homebrew_path       = Pathname.new node[:biosphere][:homebrew][:root]
homebrew_executable = homebrew_path.join('bin/brew')

caskroom_path = Pathname.new node[:biosphere][:cask][:caskroom]
applinks_path = Pathname.new node[:biosphere][:cask][:applinks]

node[:biosphere][:cask][:apps].each do |app|

  app_path = caskroom_path.join app

  if app_path.directory?
    logg(%{Skipping installation of <b>#{app}</b> via homebrew because it already exists.}) { color :yellow }

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
