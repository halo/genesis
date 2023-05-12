include_recipe 'default::xcode_license'

include_recipe 'macos'
include_recipe 'dotfiles'
include_recipe 'homebrew'
include_recipe 'apps'
include_recipe 'casks'
include_recipe 'rbenv'
include_recipe 'mas'

# Needs to run after ruby was installed
include_recipe 'dotfiles::run'
