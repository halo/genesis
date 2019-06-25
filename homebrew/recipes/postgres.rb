postgres_executable_path = Homebrew.bin_path.join('postgres')

launchd 'install-postgres-agent' do
  label 'io.github.halo.postgres'
  program_arguments [postgres_executable_path.to_s, '-D', Homebrew.var_path.join('postgres').to_s]
  username Console.user
  run_at_load true
  action :create
  only_if { postgres_executable_path.executable? }
end
