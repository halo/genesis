Homebrew.node = node

logg %(Installing homebrew casks...)

node[:cask][:apps].each do |app|
  bash "install-cask-#{app}" do
    code %(export PATH="#{Homebrew.bin_path}:#{Homebrew.sbin_path}:$PATH" && #{Homebrew.executable_path} cask install #{app})
    only_if { online? }
    not_if { Homebrew.caskroom_path.join(app).directory? }
  end
end
