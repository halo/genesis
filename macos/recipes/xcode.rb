directory = Home.path.join('Library/Developer/Xcode/UserData')
template_file = directory.join('IDETemplateMacros.plist')

directory directory.to_s do
  owner Console.user
  group 'staff'
  mode '0755'
end

cookbook_file template_file.to_s do
  owner Console.user
  group 'staff'
  mode '0644'
end
