directory Workdir.path.to_s do
  recursive true
  owner Console.user
  group 'staff'
end

include_recipe 'macos'
include_recipe 'dotfiles'
include_recipe 'homebrew'
include_recipe 'rbenv'

#include_recipe 'casks'
