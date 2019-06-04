redis_executable_path = Homebrew.bin_path.join('redis-server')
redis_config_path = Homebrew.etc_path.join('redis.conf')

launchd 'install-redis-agent' do
  label 'io.github.halo.redis'
  program_arguments [redis_executable_path.to_s, redis_config_path.to_s]
  username Console.user
  run_at_load true
  action :enable
  only_if { redis_executable_path.executable? }
end
