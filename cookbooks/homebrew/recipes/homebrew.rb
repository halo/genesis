install_script = File.join(Chef::Config[:file_cache_path], 'homebrew_installer')
cache_directory = Home.path.join('Library', 'Caches', 'Homebrew')

directories = %w[bin etc include lib sbin share var opt share/zsh share/zsh/site-functions
                 var/homebrew var/homebrew/linked Cellar Caskroom Homebrew Frameworks]

directories.each do |dir|
  directory "/usr/local/#{dir}" do
    user Console.user
    group 'staff'
  end
end

directory cache_directory.to_s do
  user Console.user
  group 'admin'
end

remote_file install_script do
  source 'https://raw.githubusercontent.com/Homebrew/install/master/install'
  user Console.user
  group 'staff'
  mode '0755'
  only_if { Internet.online? }
end

execute 'install homebrew' do
  command install_script
  environment({ HOME: Home.path.to_s, USER: Console.user })
  user Console.user
  group 'staff'
  creates '/usr/local/bin/brew'
  only_if { Internet.online? }
end

execute 'update homebrew' do
  environment({ HOME: Home.path.to_s, USER: Console.user })
  user Console.user
  group 'staff'
  command '/usr/local/bin/brew update || true'
end

execute 'disable analytics' do
  environment({ HOME: Home.path.to_s, USER: Console.user })
  user Console.user
  group 'staff'
  command "/usr/local/bin/brew analytics off"
  only_if { shell_out('/usr/local/bin/brew analytics state', user: Console.user).stdout.include?('enabled') }
end
