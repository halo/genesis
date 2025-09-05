include_recipe 'apps::xcode_license'

# This generates configuration profiles and practically never crashes.
# Sometimes I run genesis just to get these, so let's get that done first.
include_recipe 'macos'

include_recipe 'dotfiles'

include_recipe 'homebrew'
include_recipe 'mise'

# Can only run after ruby was installed
include_recipe 'dotfiles::run'

include_recipe 'apps'
include_recipe 'casks'
include_recipe 'mas'
