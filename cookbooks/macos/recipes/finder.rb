Genesis.users do |user|
  execute 'Hide ~/Applications' do
    command "chflags hidden #{user.paths.applications}"
    not_if "ls -lOd #{user.paths.applications} | grep hidden"
    only_if { user.paths.applications.directory? }
  end

  execute 'Hide ~/Public' do
    command "chflags hidden #{user.paths.public}"
    not_if "ls -lOd #{user.paths.public} | grep hidden"
  end

  if user.orange?
    execute 'Reveal ~/Library' do
      command "chflags nohidden #{user.paths.library}"
      only_if "ls -lOd #{user.paths.library} | grep hidden"
    end
  end
end
