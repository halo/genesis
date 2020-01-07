redis_executable_path = Homebrew.bin_path.join('redis-server')
redis_config_path = Homebrew.etc_path.join('redis.conf')

if Console.profile? :orange
  # sudo launchctl bootstrap system /Library/LaunchDaemons/io.github.halo.genesis.redis.plist
  # sudo launchctl bootout system/io.github.halo.genesis.redis
  launchd 'install-redis-agent' do
    label Identifier.join('redis')
    program_arguments [redis_executable_path.to_s, redis_config_path.to_s]
    username Console.user
    run_at_load true
    action :create
    only_if { redis_executable_path.executable? }
  end
end
