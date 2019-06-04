Homebrew.node = node

node[:cask][:apps].each do |app|
  execute "install-cask-#{app}" do
    #command %(export PATH="#{Homebrew.bin_path}:#{Homebrew.sbin_path}:$PATH" && #{Homebrew.executable_path} cask install #{app})
    command "#{Homebrew.executable_path} cask install #{app} --force"
    user Console.user
    group 'staff'
    only_if { Internet.online? }
    not_if "#{Homebrew.executable_path} cask list #{app}", user: Console.user
    ignore_failure true
  end
end
