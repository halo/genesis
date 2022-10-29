node[:homebrew][:taps].each do |tap|
  homebrew_tap tap do
    homebrew_path Homebrew.brew_path.to_s
    only_if { Internet.online? }
  end
end
