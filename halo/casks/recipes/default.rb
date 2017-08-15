Homebrew.node = node

node[:cask][:apps].each do |app|
  if Homebrew.caskroom_path.join(app).directory?
    logg(%(Skipping installation of <b>#{app}</b> via brew cask because it already exists.)) { color :yellow }

  elsif offline?
    logg(%(Skipping installation of cask <b>#{app}</b> because I'm not online.)) { color :yellow }

  else
    logg %(Installing #{app} via brew cask...)
    bash "install-cask-#{app}" do
      code %(export PATH="#{Homebrew.bin_path}:#{Homebrew.sbin_path}:$PATH" && #{Homebrew.executable_path} cask install #{app})
    end
  end
end
