duti_executable_path = Homebrew.bin_path.join 'duti'
duti_configuration_file = Home.path.join '.duti'

if duti_executable_path.exist? && duti_configuration_file.exist?

  logg %{Assigning default application openers...}
  bash 'run-duti' do
    code "#{duti_executable_path} #{duti_configuration_file}"
  end

else
  logg(%{Skipping assigning default application openers because duti or its configuration file appears to be missing...}) { color :yellow }
end
