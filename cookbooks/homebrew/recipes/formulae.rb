homebrew_package node[:homebrew][:formulae] do
  only_if { Internet.online? }
end

homebrew_package node[:homebrew][:edge_formulae] do
  action :upgrade
  only_if { Internet.online? }
end
