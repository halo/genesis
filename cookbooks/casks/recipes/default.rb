node[:cask][:apps].each do |app|
  homebrew_cask app do
    only_if { Internet.online? }
  end
end
