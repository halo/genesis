code_executable_path = Homebrew.bin_path.join('code')

node[:apps][:vscode_extensions].each do |extension|
  execute "install VSCode extension #{extension}" do
    command "#{code_executable_path} --install-extension #{extension}"
    user Console.user
    group 'staff'
    only_if { Internet.online? }
    only_if { code_executable_path.exist? }
    not_if "#{code_executable_path} --list-extensions | grep #{extension}"
  end
end
