homebrew_path       = Pathname.new(node[:homebrew][:root])
homebrew_bin_path   = homebrew_path.join 'bin'
homebrew_sbin_path  = homebrew_path.join 'sbin'
homebrew_executable = homebrew_bin_path.join('brew')

caskroom_path = Pathname.new node[:cask][:caskroom]
applinks_path = Pathname.new node[:cask][:applinks]

node[:cask][:apps].each do |app|

  app_path = caskroom_path.join app

  if app_path.directory?
    logg(%{Skipping installation of <b>#{app}</b> via brew cask because it already exists.}) { color :yellow }

  else
    if offline?
      logg(%{Skipping installation of cask <b>#{app}</b> because I'm not online.}) { color :yellow }
    else
      logg %{Installing #{app} via cask...}
      bash "install-cask-#{app}" do
        environment({
          'HOMEBREW_CASK_OPTS' => "--caskroom='#{caskroom_path}' --appdir='#{applinks_path}'",
        })
        code %{export PATH="#{homebrew_bin_path}:#{homebrew_sbin_path}:$PATH" && #{homebrew_executable} cask install #{app}}
      end
    end
  end

end
