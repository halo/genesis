Genesis.users do |account|
  directory account.paths.ssh.to_s do
    owner account.username
    group 'staff'
    mode '0700'
  end

  file account.paths.ssh.join('config').to_s do
    owner account.username
    group 'staff'
    mode '0644'
  end

  file account.paths.ssh.join('authorized_keys').to_s do
    owner account.username
    group 'staff'
    mode '0644'
  end
end
