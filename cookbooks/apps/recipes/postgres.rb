postgres_executable_path = Homebrew.bin_path.join('postgres')
data_path = Home.projects.join('databases', 'postgres')

# initdb -D ~/Code/databases/postgres
directory data_path.to_s do
  mode '755'
  owner Console.user
  group 'staff'
  recursive true
end

if Console.profile? :orange
  # sudo launchctl bootstrap system /Library/LaunchDaemons/io.github.halo.genesis.postgres.plist
  # sudo launchctl bootout system/io.github.halo.genesis.postgres
  launchd 'install-postgres-agent' do
    label Identifier.join('postgres')
    program_arguments [postgres_executable_path.to_s, '-D', data_path.to_s]
    username Console.user
    run_at_load true
    action :create
    only_if { postgres_executable_path.executable? }
  end
end
