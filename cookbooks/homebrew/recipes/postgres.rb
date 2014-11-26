if node[:homebrew][:formulae].include? 'postgresql'

  postgresql_var_path         = Homebrew.var_path.join 'postgres'
  postgresql_config_file_path = Homebrew.etc_path.join 'postgresql.conf'
  postgres_formula_path       = Homebrew.cellar_path.join "Cellar/postgresql"

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
