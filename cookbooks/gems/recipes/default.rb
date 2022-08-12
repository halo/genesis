# gem_binary = Pathname.new(node[:rbenv][:root]).join('shims', 'gem')

# node[:gems][:gems].each do |gem|
#   execute "install gem #{gem}" do
#     command "#{gem_binary} install #{gem}"
#     user Console.user
#     group 'staff'
#     only_if { Internet.online? }
#     only_if { gem_binary.executable? }
#     not_if "#{gem_binary} info --installed #{gem}"
#   end
# end
