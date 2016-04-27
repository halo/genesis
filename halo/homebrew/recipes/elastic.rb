if node[:homebrew][:formulae].include? 'elasticsearch'

  elasticsearch_config_file_path = Homebrew.path.join 'opt/elasticsearch/config/elasticsearch.yml'

  unless Homebrew.var_path.directory?
    logg(%{Skipping configuration of <b>elasticsearch</b> because homebrew is missing.}) { color :yellow }
  else
    logg %{Configuring Elastic Search...}

    template elasticsearch_config_file_path.to_s do
      source 'elasticsearch/elasticsearch.yml.erb'
      variables({
        homebrew_var_path: Homebrew.var_path,
      })
    end
  end

end
