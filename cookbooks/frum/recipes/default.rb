frum_path = Pathname.new node[:frum][:root]
frum_executable = Homebrew.bin_path.join('frum')

directory frum_path.to_s do
  owner Console.user
  group 'staff'
end

# Set global default ruby version
file frum_path.join('version').to_s do
  content node[:frum][:ruby]
  owner Console.user
  group 'staff'
end

version = node[:frum][:ruby]
execute "install ruby #{version}" do
  cwd Home.path.to_s
  environment(lazy { { frum_ROOT: frum_path.to_s } })
  command %{eval "$(#{frum_executable} init -)" && #{frum_executable} install #{version}}
  creates frum_path.join('versions', version, 'bin').to_s
  user Console.user
  group 'staff'
  only_if { frum_executable.executable? }
  not_if { shell_out("#{Homebrew.bin_path.join('frum')} versions", user: Console.user).stdout.include?(version) }
end
