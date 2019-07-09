directory = Home.path.join('.ssh')
config_file = directory.join('config')
authorized_keys_file = directory.join('authorized_keys')

directory directory.to_s do
  owner Console.user
  group 'staff'
  mode '0700'
end

file config_file.to_s do
  owner Console.user
  group 'staff'
  mode '0644'
end

file authorized_keys_file.to_s do
  owner Console.user
  group 'staff'
  mode '0644'
end
