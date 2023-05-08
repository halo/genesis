install_script_path = File.join(Chef::Config[:file_cache_path], 'homebrew_installer')

remote_file install_script_path do
  source 'https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'
  user Console.user
  group 'staff'
  mode '0755'
  only_if { Internet.online? }
end

execute 'install homebrew' do
  command "sudo whoami && #{install_script_path}"
  environment({ HOME: Home.path.to_s, USER: Console.user })
  user Console.user
  group 'staff'
  creates Homebrew.brew_path.to_s
  only_if { Internet.online? }
end

execute 'update homebrew' do
  environment({ HOME: Home.path.to_s, USER: Console.user })
  user Console.user
  group 'staff'
  command "#{Homebrew.brew_path} update || true"
end

execute 'disable analytics' do
  environment({ HOME: Home.path.to_s, USER: Console.user })
  user Console.user
  group 'staff'
  command "#{Homebrew.brew_path} analytics off"
  only_if { shell_out("#{Homebrew.brew_path} analytics state", user: Console.user).stdout.include?('enabled') }
end
