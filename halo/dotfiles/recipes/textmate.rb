support_path = Home.path.join('Library/Application Support/Avian')
bundles_path = support_path.join('Bundles')

logg %{Ensuring Textmate Application Support directory...}
directory support_path.to_s do
  recursive true
end

logg %{Ensuring Textmate Bundles...}
git bundles_path.to_s do
  repository 'https://github.com/halo/tmbundles.git'
end
