node[:homebrew][:taps].each do |tap|
  homebrew_tap tap do
    owner Console.user
    only_if { Internet.online? }
  end
end
