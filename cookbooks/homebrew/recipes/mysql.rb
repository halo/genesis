if node[:homebrew][:formulae].include? 'mysql'

  mysql_config_path = Homebrew.etc_path.join 'my.cnf'
  mysql_data_path   = Homebrew.var_path.join 'mysql'

  unless Homebrew.etc_path.directory?
    logg(%{Skipping configuration of <b>mysql</b> because homebrew is missing.}) { color :yellow }
  else
    logg %{Configuring MySQL...}
    cookbook_file mysql_config_path.to_s do
      mode '0644'
      source 'mysql/my.cnf'
    end
  end

  mysql_dir = Homebrew.path.join 'var/mysql/mysql'

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
        code %{mysql_install_db --verbose --user=`whoami` --basedir="$(#{Homebrew.executable_path} --prefix mysql)" --datadir=#{mysql_data_path} --tmpdir=/tmp}
      end
    end
  end

end
