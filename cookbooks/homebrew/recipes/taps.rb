if arm?
  # See https://github.com/chef/chef/blob/b668235003f7f32b96e1efb2e596cc15b0da78fc/lib/chef/mixin/homebrew_user.rb#L63
  node[:homebrew][:taps].each do |tap|
    execute "brew tap #{tap}" do
      command "#{Homebrew.brew_path} tap #{tap}"
      environment({ HOME: Home.path.to_s, USER: Console.user })
      user Console.user
      group 'staff'
      only_if { Internet.online? }
    end
  end

else
  node[:homebrew][:taps].each do |tap|
    homebrew_tap tap do
      owner Console.user
      only_if { Internet.online? }
    end
  end
end

