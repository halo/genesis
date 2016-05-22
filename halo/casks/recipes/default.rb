Homebrew.node = node
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
          'HOMEBREW_CASK_OPTS' => "--binarydir='#{Homebrew.bin_path}' --caskroom='#{caskroom_path}' --appdir='#{applinks_path}'",
        })
        code %{export PATH="#{Homebrew.bin_path}:#{Homebrew.sbin_path}:$PATH" && #{Homebrew.executable_path} cask install #{app}}
      end
    end
  end

end
