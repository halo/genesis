container = Home.path.join('/usr/local/bin')

directory container.to_s do
  recursive true
end

cookbook_file container.join('ppvpn').to_s do
  source 'ppvpn'
end
