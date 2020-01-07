node[:homebrew][:taps].each do |tap|
  homebrew_tap tap do
    only_if { Internet.online? }
  end
end
