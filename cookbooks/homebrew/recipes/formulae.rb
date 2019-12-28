homebrew_tap 'homebrew/cask-fonts' do
  only_if { Internet.online? }
end

node[:homebrew][:formulae].each do |formula|
  homebrew_package formula do
    action(node[:homebrew][:edge_formulae].include?(formula) ? :upgrade : :install)
    only_if { Internet.online? }
  end
end
