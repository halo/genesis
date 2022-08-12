postgres_executable_path = Homebrew.bin_path.join('postgres')
data_path = Home.projects.join('databases', 'postgres')

# This directory is needed to run `initdb -D ~/Code/databases/postgres`
# The permissions need to be 700, otherwise you'll get this error:
#   FATAL:  data directory "/Users/.../Code/databases/postgres" has invalid permissions
#   DETAIL:  Permissions should be u=rwx (0700) or u=rwx,g=rx (0750).
directory data_path.to_s do
  mode '700'
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
