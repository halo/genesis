# Avoiding all apps reopening on reboot.
# See https://apple.stackexchange.com/a/309140

Genesis.users do |account|
  by_host_path = account.paths.by_host
  loginwindow_glob = "#{by_host_path}/com.apple.loginwindow*"

  execute "rootify #{account.home.basename} loginwindows" do
    command "chown root #{loginwindow_glob}"
    user 'root'
    only_if { by_host_path.directory? }
  end

  execute "lock #{account.home.basename} loginwindows" do
    command "chmod 000 #{loginwindow_glob}"
    user 'root'
    only_if { by_host_path.directory? }
  end
end
