compose_path = Workdir.path.join('docker-compose.yml')
storage_path = Workdir.path.join('storage')

logg %(Ensuring docker storage directory...)
directory storage_path.to_s

logg %(Ensuring storage directory for Postgres 10...)
posgres10_data_path = storage_path.join('postgres10')
directory posgres10_data_path.to_s

logg %(Ensuring storage directory for Redis...)
redis_data_path = storage_path.join('redis')
directory redis_data_path.to_s

logg %(Ensuring docker compose configuration file...)
template compose_path.to_s do
  source 'docker-compose.yml.erb'
  variables(
    postgres10_data_path: posgres10_data_path,
    redis_data_path: redis_data_path,
  )
end

logg %(Running docker compose...)
bash 'docker-compose' do
  cwd Workdir.path.to_s
  code %(docker-compose up -d)
  only_if { Pathname.new('/usr/local/bin/docker-compose').exist? }
  only_if '/usr/local/bin/docker ps'
end
