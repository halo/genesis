execute 'create locate database' do
  command '/bin/launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist'
  creates '/var/db/locate.database'
end
