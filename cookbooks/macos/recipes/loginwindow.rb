# Avoiding all apps reopening on reboot.
# See https://apple.stackexchange.com/a/309140

Genesis.users do |user|
  by_host_path = user.paths.by_host
  loginwindow_glob = "#{by_host_path}/com.apple.loginwindow*"

  execute "rootify #{user.home.basename} loginwindows" do
    command "chown root #{loginwindow_glob}"
    user 'root'
    only_if { by_host_path.directory? }
  end

  execute "lock #{user.home.basename} loginwindows" do
    command "chmod 000 #{loginwindow_glob}"
    user 'root'
    only_if { by_host_path.directory? }
  end
end
