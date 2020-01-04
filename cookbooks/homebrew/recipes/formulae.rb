node[:homebrew][:taps].each do |tap|
  homebrew_tap tap do
    only_if { Internet.online? }
  end
end

node[:homebrew][:formulae].each do |formula|
  homebrew_package formula do
    action(node[:homebrew][:edge_formulae].include?(formula) ? :upgrade : :install)
    only_if { Internet.online? }
  end
end
