Genesis.users do |account|
  execute 'Hide ~/Applications' do
    command "chflags hidden #{account.paths.applications}"
    not_if "ls -lOd #{account.paths.applications} | grep hidden"
    only_if { account.paths.applications.directory? }
  end

  execute 'Hide ~/Public' do
    command "chflags hidden #{account.paths.public}"
    not_if "ls -lOd #{account.paths.public} | grep hidden"
  end

  if account.orange?
    execute 'Reveal ~/Library' do
      command "chflags nohidden #{account.paths.library}"
      only_if "ls -lOd #{account.paths.library} | grep hidden"
    end
  end
end
