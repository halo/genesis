node[:cask][:apps].each do |app|
  homebrew_cask app do
    homebrew_path ::Homebrew.brew_path.to_s
    only_if { Internet.online? }
    ignore_failure true # In case an application was installed via dmg
  end
end
