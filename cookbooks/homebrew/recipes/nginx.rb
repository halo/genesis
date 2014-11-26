if node[:homebrew][:formulae].include? 'nginx --with-passenger'

  nginx_config_path  = Homebrew.path.join 'etc/nginx'
  nginx_configs_path = nginx_config_path.join('conf')
  passenger_root     = Homebrew.path.join 'opt/passenger/libexec'
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
