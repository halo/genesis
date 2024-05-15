Genesis.users do |user|
  directory = user.paths.home.join('Library/Developer/Xcode/UserData')
  template_file = directory.join('IDETemplateMacros.plist')

  directory directory.to_s do
    owner user.username
    group 'staff'
    mode '0755'
    recursive true
  end

  cookbook_file template_file.to_s do
    owner user.username
    group 'staff'
    mode '0644'
  end
end
