node[:cask][:apps].each do |app|
  homebrew_cask app do
    homebrew_path Homebrew.brew_path.to_s
    only_if { Internet.online? }
  end
end
