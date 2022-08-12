user_applications_path = Home.path.join('Applications')
user_library_path = Home.path.join('Library')

execute 'Hide ~/Applications' do
  command "chflags hidden #{user_applications_path}"
  only_if "ls -lOd #{user_applications_path} | grep hidden"
  only_if { user_applications_path.directory? }
end

if Console.profile? :orange
  execute 'Reveal ~/Library' do
    command "chflags nohidden #{user_library_path}"
    only_if "ls -lOd #{user_library_path} | grep hidden"
  end
end
