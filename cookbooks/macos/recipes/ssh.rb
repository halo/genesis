Genesis.users do |user|
  directory user.paths.ssh.to_s do
    owner user.username
    group 'staff'
    mode '0700'
  end

  file user.paths.ssh.join('config').to_s do
    owner user.username
    group 'staff'
    mode '0644'
  end

  file user.paths.ssh.join('authorized_keys').to_s do
    owner user.username
    group 'staff'
    mode '0644'
  end
end
