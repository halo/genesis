support_path = Home.path.join 'Library', 'Application Support', 'TextMate'
bundles_path = support_path.join 'Bundles'

directory support_path.to_s do
  recursive true
  owner Console.user
  group 'staff'
end

git bundles_path.to_s do
  repository 'https://github.com/halo/tmbundles.git'
  action :sync
  checkout_branch 'master'
  user Console.user
  group 'staff'
  only_if { Internet.online? }
end
