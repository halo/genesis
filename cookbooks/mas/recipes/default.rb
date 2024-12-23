Genesis.users do |account|
  next unless account.opinionated?

  mas_binary = ::Homebrew.bin_path.join('mas')

  node[:mas][:apps].each do |app|
    execute "install #{app}" do
      command "#{mas_binary} install #{app}"
      user account.username
      group 'staff'
      only_if { Internet.online? }
      only_if { mas_binary.exist? }
      only_if "#{mas_binary} account"
      not_if "#{mas_binary} list | grep #{app}"
    end
  end
end
