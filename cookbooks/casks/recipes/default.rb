node[:cask][:apps].each do |app|
  homebrew_cask app do
    install_cask false # Error: Tapping homebrew/cask is no longer typically necessary. Add --force if you are sure you need it for contributing to Homebrew.
    homebrew_path Homebrew.brew_path.to_s
    only_if { Internet.online? }
   # ignore_failure true # In case an application was installed via dmg
  end
end
