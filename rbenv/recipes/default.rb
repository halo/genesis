rbenv_path = Pathname.new node[:rbenv][:root]
homebrew_bin_path = Pathname.new(node[:homebrew][:root]).join 'bin'
rbenv_executable = homebrew_bin_path.join('rbenv')

directory rbenv_path.to_s do
  owner Console.user
  group 'staff'
end

# Set global default ruby version
# See https://github.com/rbenv/rbenv/blob/4e923221ce57a04ab52bddd638473d566347711f/libexec/rbenv-version-file#L27
file rbenv_path.join('version').to_s do
  content node[:rbenv][:rubies].first
  owner Console.user
  group 'staff'
end

node[:rbenv][:rubies].each do |version|
  execute "install-ruby-#{version}" do
    cwd Home.path.to_s
    environment({ 'RBENV_ROOT' => rbenv_path.to_s })
    command %{eval "$(#{rbenv_executable} init -)" && #{rbenv_executable} install #{version}}
    creates rbenv_path.join('versions', version, 'bin').to_s
    user Console.user
    group 'staff'
    only_if { rbenv_executable.executable? }
  end
end
