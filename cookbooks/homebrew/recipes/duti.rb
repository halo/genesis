duti_executable_path = Homebrew.bin_path.join 'duti'
duti_configuration_file = Home.path.join '.duti'

execute 'run-duti' do
  command "#{duti_executable_path} #{duti_configuration_file}"
  user Console.user
  only_if { duti_executable_path.exist? }
  only_if { duti_configuration_file.exist? }
end
