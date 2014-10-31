require 'pathname'

homebrew_path       = Pathname.new node[:homebrew][:root]
homebrew_revision   = node[:homebrew][:revision]
homebrew_bin_path   = homebrew_path.join 'bin'
homebrew_executable = homebrew_bin_path.join('brew')

# –––––––––––––––––––––
# Homebrew Installation
# –––––––––––––––––––––

if offline?
  logg(%{Skipping installation of <b>homebrew</b> because I'm not online.}) { color :yellow }
else
  logg %{Ensuring X-Code Command line tools...}
  bash 'ensure-xcode-clt' do
    code 'xcode-select --install; echo "This command never fails :)"'
  end
  
  logg %{Ensuring correct homebrew revision...}
  git homebrew_path.to_s do
    repository 'https://github.com/mxcl/homebrew.git'
    revision homebrew_revision
    action :sync
  end

  if homebrew_executable.executable?
    current_taps = `#{homebrew_executable} tap`.split
    wanted_taps = %w{ phinze/cask }

    wanted_taps.each do |tap|
      if current_taps.include? tap
        logg(%{Skipping tapping homebrew into <b>#{tap}</b> because it's already tapped...}) { color :yellow }
      else
        logg %{Tapping homebrew into <b>#{tap}</b>...}
        bash "tap-#{tap}" do
          code "#{homebrew_executable} tap #{tap}"
        end
      end
    end
  end

end

# –––––––––––––––––
# Homebrew Formulae
# –––––––––––––––––

node[:homebrew][:formulae].each do |formula|

  formula_path = homebrew_path.join "Cellar/#{formula.split.first}"

  if formula_path.exist?
    logg(%{Skipping configuration of <b>#{formula}</b> via homebrew because it already exists.}) { color :yellow }

    if node[:homebrew][:edge_formulae].include?(formula)
      logg %{Ensuring cutting-edge #{formula} via homebrew...}
      bash "upgrade-#{formula}" do
        code "#{homebrew_executable} upgrade #{formula} || echo 'Probably already up-to-date...' "
      end
    end
  else
    if offline?
      logg(%{Skipping installation of formula <b>#{formula}</b> because I'm not online.}) { color :yellow }
    else
      logg %{Installing #{formula} via homebrew...}
      bash "install-#{formula}" do
        code "#{homebrew_executable} install #{formula}"
      end
    end
  end

end

# ––––––––––––––––––––
# Post-install configs
# ––––––––––––––––––––

# MySQL

if node[:homebrew][:formulae].include? 'mysql'

  etc_path          = homebrew_path.join 'etc'
  mysql_config_path = etc_path.join 'my.cnf'

  unless etc_path.directory?
    logg(%{Skipping configuration of <b>mysql</b> because homebrew is missing.}) { color :yellow }
  else
    logg %{Configuring MySQL...}
    cookbook_file mysql_config_path.to_s do
      mode '0644'
      source 'mysql/my.cnf'
    end
  end

  mysql_dir = homebrew_path.join 'var/mysql/mysql'

  unless mysql_config_path.exist?
    logg(%{Skipping initialization of <b>mysql</b> because MySQL seems not to be configured.}) { color :yellow }
  else
    if mysql_dir.exist?
      logg(%{Skipping initialization of <b>mysql</b> because it is already initialized.}) { color :yellow }
    else
      logg %{Initializing Mysql DB...}
      bash 'initialize-mysql' do
        cwd ENV['HOME']
        environment({ 'HOME' => ENV['HOME'] })
        code %{mysql_install_db --verbose --user=`whoami` --basedir="$(#{homebrew_executable} --prefix mysql)" --datadir=#{homebrew_path}/var/mysql --tmpdir=/tmp}
      end
    end
  end

end

# Elastic Search

if node[:homebrew][:formulae].include? 'elasticsearch'

  elasticsearch_config_file_path = homebrew_path.join 'opt/elasticsearch/config/elasticsearch.yml'
  homebrew_var_path = homebrew_path.join 'var'

  unless homebrew_var_path.directory?
    logg(%{Skipping configuration of <b>elasticsearch</b> because homebrew is missing.}) { color :yellow }
  else
    logg %{Configuring Elastic Search...}

    template elasticsearch_config_file_path.to_s do
      source 'elasticsearch/elasticsearch.yml.erb'
      variables({
        :elasticsearch_var_path => homebrew_var_path,
      })
    end
  end

end

# Nginx

if node[:homebrew][:formulae].include? 'nginx --with-passenger'

  nginx_config_path  = homebrew_path.join 'etc/nginx'
  nginx_configs_path = nginx_config_path.join('conf')
  passenger_root     = homebrew_path.join 'opt/passenger/libexec'
  passenger_ruby     = Pathname.new File.join(node[:biosphere][:rbenv][:root], "versions/#{node[:biosphere][:rbenv][:rubies].first}/bin/ruby")

  unless nginx_config_path.directory?
    logg(%{Skipping configuration of <b>nginx (with passenger)</b> because it appears to be missing.}) { color :yellow }
  else

    logg %{Ensuring conf directory...}
    directory nginx_configs_path.to_s do
      mode '755'
    end

    logg %{Configuring Nginx (with Passenger)...}
    template nginx_config_path.join('nginx.conf').to_s do
      source 'nginx/nginx.conf.erb'
      variables({
        :passenger_root     => passenger_root,
        :passenger_ruby     => passenger_ruby,
        :nginx_configs_path => nginx_configs_path,
      })
    end

    projects_path = Pathname.new('~/Code').expand_path

    template nginx_configs_path.join('cortana.conf').to_s do
      source 'nginx/cortana.conf.erb'
      variables({
        port:          (ENV['BIOSPHERE_ENV_NGINX_PORT'] || 8080),
        projects_path: projects_path.to_s,
      })
    end

  end

end

# DNSMasq

if node[:homebrew][:formulae].include? 'dnsmasq'

  dnsmasq_config_path = homebrew_path.join 'etc'
  dnsmasq_config_file_path = dnsmasq_config_path.join 'dnsmasq.conf'

  logg %{Ensuring homebrew directory...}
  directory dnsmasq_config_path.to_s do
    mode '0755'
    recursive true
  end
  
  logg %{Configuring DNSMasq...}
  cookbook_file dnsmasq_config_file_path.to_s do
    mode '0644'
    source 'dnsmasq/dnsmasq.conf'
  end

end

# PostgreSQL

if node[:homebrew][:formulae].include? 'postgresql'

  postgresql_var_path         = homebrew_path.join 'var/postgres'
  postgresql_config_file_path = homebrew_path.join 'etc/postgresql.conf'
  postgres_formula_path       = homebrew_path.join "Cellar/postgres"

  if !postgres_formula_path.exist?
    logg(%{Skipping 1st time initialization of <b>PostgreSQL</b> because it does not appear to be installed yet.}) { color :yellow }
  elsif postgresql_var_path.exist?
    logg(%{Skipping 1st time initialization of <b>PostgreSQL</b> because it was already performed.}) { color :yellow }
  else
    logg %{1st time Postgresql initialization...}
    bash "postgresql-initdb" do
      code "initdb -E UTF8 #{postgresql_var_path.to_s}"
    end
  end

  logg %{Configuring Postgresql...}
  cookbook_file postgresql_config_file_path.to_s do
    mode '0644'
    source 'postgresql/postgresql.conf'
  end

end
