# Avoiding all apps reopening on reboot.
# See https://apple.stackexchange.com/a/309140

# Find our real user home directories.
# %w[alice bob .localized Shared] #=> %w[alice bob]
home_paths = Pathname.new('/Users')
                     .children
                     .select { _1.basename.to_s.match?(/^[a-z][a-z]*/) }

home_paths.each do |home_path|
  by_host_path = home_path.join('Library/Preferences/ByHost')
  loginwindow_glob = "#{by_host_path}/com.apple.loginwindow*"

  execute "rootify #{home_path.basename} loginwindows" do
    command "chown root #{loginwindow_glob}"
    user 'root'
    only_if { by_host_path.directory? }
  end

  execute "lock #{home_path.basename} loginwindows" do
    command "chmod 000 #{loginwindow_glob}"
    user 'root'
    only_if { by_host_path.directory? }
  end
end
