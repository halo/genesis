bundles_path = Home.path.join('Library/Application Support/Avian/Bundles')

logg %{Ensuring Textmate Bundles...}
git bundles_path.to_s do
  repository 'https://github.com/halo/tmbundles.git'
end
