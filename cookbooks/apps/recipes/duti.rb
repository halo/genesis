duti_executable_path = Homebrew.bin_path.join 'duti'

Genesis.users do |account|
  duti_configuration_file = account.paths.home.join('.duti')

  execute 'run-duti' do
    command "#{duti_executable_path} #{duti_configuration_file}"
    user account.username
    only_if { duti_executable_path.exist? }
    only_if { duti_configuration_file.exist? }
  end
end
