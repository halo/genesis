git Homebrew.path.to_s do
  repository 'https://github.com/Homebrew/brew.git'
  action :sync
  checkout_branch 'master'
  user Console.user
  group 'staff'
  only_if { Internet.online? }
end

directory Homebrew.etc_path.to_s do
  mode '755'
  owner Console.user
  group 'staff'
end

execute 'tap-homebrew-fonts' do
  command "#{Homebrew.executable_path} tap caskroom/fonts"
  user Console.user
  group 'staff'
  only_if { Internet.online? }
  creates Homebrew.taps_path.join('caskroom/homebrew-fonts').to_s
end

node[:homebrew][:formulae].each do |formula|
  execute "install-formula-#{formula}" do
    command "#{Homebrew.executable_path} install #{formula}"
    user Console.user
    creates Homebrew.path.join('Cellar', formula.split.first).to_s
    only_if { Internet.online? }
  end

  execute "upgrade-formula-#{formula}" do
    command "#{Homebrew.executable_path} upgrade #{formula}"
    user Console.user
    returns [0, 1]
    only_if { node[:homebrew][:edge_formulae].include?(formula) }
    only_if { Internet.online? }
  end
end
