if node[:homebrew][:formulae].include? 'dnsmasq'

  dnsmasq_config_file_path = Homebrew.etc_path.join 'dnsmasq.conf'

  logg %{Ensuring homebrew etc directory...}
  directory Homebrew.etc_path.to_s do
    mode '0755'
    recursive true
  end

  logg %{Configuring DNSMasq...}
  cookbook_file dnsmasq_config_file_path.to_s do
    mode '0644'
    source 'dnsmasq/dnsmasq.conf'
  end

end
